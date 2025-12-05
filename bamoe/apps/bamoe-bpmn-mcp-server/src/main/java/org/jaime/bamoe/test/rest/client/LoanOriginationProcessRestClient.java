package org.jaime.bamoe.test.rest.client;

import org.eclipse.microprofile.rest.client.inject.RegisterRestClient;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.ws.rs.Consumes;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.Response;

@ApplicationScoped
@RegisterRestClient(configKey = "bamoe-loans")
@Path("/LoanOriginationProcess")
public interface LoanOriginationProcessRestClient {


    @POST
    @Produces({ "application/json" })
    @Consumes({ "application/json" })
    Response startLoanOriginationProcess(Integer loanDuration, Integer loanAmount, String applicantName,
            Integer applicantMonthlyIncomes, Integer applicantMonthlyExpenses, Integer applicantAge, Boolean applicantHasJob,
            Boolean applicantHasActiveDebts, Integer applicantYearsInCurrentJob);
}
