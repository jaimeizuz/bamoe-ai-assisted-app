package org.jaime.bamoe.test.mcp.server;

import jakarta.inject.Inject;
import jakarta.inject.Singleton;

import java.util.HashMap;
import java.util.Map;

import org.kie.dmn.feel.lang.types.impl.ComparablePeriod;
import org.kie.kogito.Application;
import org.kie.kogito.dmn.rest.DMNFEELComparablePeriodSerializer;
import org.kie.kogito.incubation.application.AppRoot;
import org.kie.kogito.incubation.common.DataContext;
import org.kie.kogito.incubation.common.MapDataContext;
import org.kie.kogito.incubation.decisions.DecisionIds;
import org.kie.kogito.incubation.decisions.services.DecisionService;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import io.quarkiverse.mcp.server.McpLog;
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

    @Tool(name = "performLoanApplicationEligibilityChecks", description = "Evaluates the eligibility of an applicant requesting a loan")
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

}
