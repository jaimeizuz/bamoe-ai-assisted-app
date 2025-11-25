package org.jaime.bamoe.test.mcp.server;

import jakarta.inject.Inject;
import jakarta.inject.Singleton;

import java.util.HashMap;
import java.util.Map;

import org.kie.kogito.incubation.application.AppRoot;
import org.kie.kogito.incubation.common.DataContext;
import org.kie.kogito.incubation.common.MapDataContext;
import org.kie.kogito.incubation.decisions.DecisionIds;
import org.kie.kogito.incubation.decisions.services.DecisionService;

import io.quarkiverse.mcp.server.McpLog;
import io.quarkiverse.mcp.server.Prompt;
import io.quarkiverse.mcp.server.PromptArg;
import io.quarkiverse.mcp.server.PromptMessage;
import io.quarkiverse.mcp.server.TextContent;
import io.quarkiverse.mcp.server.Tool;
import io.quarkiverse.mcp.server.ToolArg;
import io.smallrye.common.annotation.RunOnVirtualThread;

import io.quarkus.logging.Log;

@Singleton
public class LoansDecisionsMcpServer {

    @Inject
    AppRoot appRoot;

    @Inject
    DecisionService svc;

    @Tool(
        name = "evaluate_loan_application_eligibility_checks",
        description = "Evaluates the eligibility of an applicant requesting a loan")
    @RunOnVirtualThread
    public DataContext performLoanApplicationEligibilityChecks(
            @ToolArg(description = "Loan duration (in months)") Integer loanDuration,
            @ToolArg(description = "Loan amount (in Euros)") Integer loanAmount,
            @ToolArg(description = "Applicant monthly incomes (in Euros)") Integer applicantMonthlyIncomes,
            @ToolArg(description = "Applicant monthly expenses (in Euros)") Integer applicantMonthlyExpenses,
            @ToolArg(description = "Applicant age") Integer applicantAge,
            McpLog log) {

        Log.infof("Performing Loan Application Eligibility Checks with "
            + "Loan duration=%s, Loan amount=%s, Applicant monthly incomes=%s, Applicant monthly expenses=%s, Applicant age=%s",
                loanDuration, loanAmount, applicantMonthlyIncomes, applicantMonthlyExpenses, applicantAge);

        var id = appRoot.get(DecisionIds.class).get("Loans", "LoanApplicationEligibilityChecks");

        Map<String, Object> inputs = new HashMap<String, Object>();
        inputs.put("LoanDuration", loanDuration);
        inputs.put("LoanAmount", loanAmount);
        inputs.put("ApplicantMonthlyIncomes", applicantMonthlyIncomes);
        inputs.put("ApplicantMonthlyExpenses", applicantMonthlyExpenses);
        inputs.put("ApplicantAge", applicantAge);
            
        return svc.evaluate(id, MapDataContext.of(inputs)).data();
    }

    @Prompt(
        name = "analyze_loan_application_eligibility",
        description = "Asks the Loans Agent to analyze a Loan Application Eligibility given applicant's data") 
    PromptMessage analyzeLoanApplicantEligibility(
            @PromptArg(description = "Loan duration (in months)") String loanDuration,
            @PromptArg(description = "Loan amount (in Euros)") String loanAmount,
            @PromptArg(description = "Applicant monthly incomes (in Euros)") String applicantMonthlyIncomes,
            @PromptArg(description = "Applicant monthly expenses (in Euros)") String applicantMonthlyExpenses,
            @PromptArg(description = "Applicant age") String applicantAge,
            @PromptArg(description = "Applicant name") String applicantName) { 

        return PromptMessage.withUserRole(
            new TextContent("Evaluate the eligibility of " + applicantName + ", who requests a loan with the following data:"
                +   " loanDuration=" + loanDuration
                +   " loanAmount=" + loanAmount
                +   " applicantMonthlyIncomes=" + applicantMonthlyIncomes
                +   " applicantMonthlyExpenses=" + applicantMonthlyExpenses
                +   " applicantAge=" + applicantAge));
    }

}
