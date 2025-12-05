package org.jaime.bamoe.test.mcp.server;

import jakarta.inject.Inject;
import jakarta.inject.Singleton;
import jakarta.ws.rs.core.Response;

import java.util.HashMap;
import java.util.Map;

import org.eclipse.microprofile.rest.client.inject.RestClient;
import org.jaime.bamoe.test.rest.client.LoanOriginationProcessRestClient;
import org.jaime.bamoe.test.rest.client.dto.LoanRequestDataDTO;

import io.quarkiverse.mcp.server.McpLog;
import io.quarkiverse.mcp.server.Tool;
import io.quarkiverse.mcp.server.ToolArg;
import io.smallrye.common.annotation.RunOnVirtualThread;

import io.quarkus.logging.Log;

@Singleton
public class LoanOriginationProcessMcpServer {

    /*
    @Inject
    AppRoot appRoot;

    @Inject
    StatefulProcessService processService;
    */

    @RestClient
    @Inject
    LoanOriginationProcessRestClient loanOriginationProcessRestClient;

    @Tool(
        name = "start_loan_origination_process",
        description = "Starts a Loan Origination Process")
    @RunOnVirtualThread
    //public DataContext startLoanOriginationProcess(
    public Response startLoanOriginationProcess(
            @ToolArg(description = "Loan duration (in months)") Integer loanDuration,
            @ToolArg(description = "Loan amount (in Euros)") Integer loanAmount,
            @ToolArg(description = "Applicant name") String applicantName,
            @ToolArg(description = "Applicant monthly incomes (in Euros)") Integer applicantMonthlyIncomes,
            @ToolArg(description = "Applicant monthly expenses (in Euros)") Integer applicantMonthlyExpenses,
            @ToolArg(description = "Applicant age") Integer applicantAge,
            @ToolArg(description = "Applicant has job") Boolean applicantHasJob,
            @ToolArg(description = "Applicant has active debts") Boolean applicantHasActiveDebts,
            @ToolArg(description = "Applicant years in current job") Integer applicantYearsInCurrentJob,
            McpLog log) {

        Log.infof("Start Loan Origination Process with "
            + "Loan duration=%s, Loan amount=%s, Applicant monthly incomes=%s, Applicant monthly expenses=%s, Applicant age=%s",
                loanDuration, loanAmount, applicantMonthlyIncomes, applicantMonthlyExpenses, applicantAge);

        /*
        var id = appRoot.get(ProcessIds.class).get("LoanOriginationProcess");

        Map<String, Object> inputs = new HashMap<String, Object>();
        inputs.put("loanDuration", loanDuration);
        inputs.put("loanAmount", loanAmount);
        inputs.put("applicantName", applicantName);
        inputs.put("applicantMonthlyIncomes", applicantMonthlyIncomes);
        inputs.put("applicantMonthlyExpenses", applicantMonthlyExpenses);
        inputs.put("applicantAge", applicantAge);
        inputs.put("applicantHasJob", applicantHasJob);
        inputs.put("applicantHasActiveDebts", applicantHasActiveDebts);
        inputs.put("applicantYearsInCurrentJob", applicantYearsInCurrentJob);

        ExtendedDataContext processResponse = processService.create(id, MapDataContext.of(inputs));
         */

        return loanOriginationProcessRestClient.startLoanOriginationProcess(
                new LoanRequestDataDTO(loanAmount, loanDuration, applicantMonthlyIncomes,
                    applicantMonthlyExpenses, applicantAge, applicantHasJob,
                    applicantHasActiveDebts, applicantYearsInCurrentJob));
    }
}
