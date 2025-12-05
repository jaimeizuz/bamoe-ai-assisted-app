package org.jaime.bamoe.test.rest.client.dto;

import java.io.Serializable;

public class LoanRequestDataDTO implements Serializable {

    private Integer loanAmount;
    private Integer loanDuration;
    private Integer applicantMonthlyIncomes;
    private Integer applicantMonthlyExpenses;
    private Integer applicantAge;
    private Boolean applicantHasJob;
    private Boolean applicantHasActiveDebts;
    private Integer applicantYearsInCurrentJob;    

    public LoanRequestDataDTO() {
    }
    
    public LoanRequestDataDTO(Integer loanAmount, Integer loanDuration, Integer applicantMonthlyIncomes,
            Integer applicantMonthlyExpenses, Integer applicantAge, Boolean applicantHasJob,
            Boolean applicantHasActiveDebts, Integer applicantYearsInCurrentJob) {
        this.loanAmount = loanAmount;
        this.loanDuration = loanDuration;
        this.applicantMonthlyIncomes = applicantMonthlyIncomes;
        this.applicantMonthlyExpenses = applicantMonthlyExpenses;
        this.applicantAge = applicantAge;
        this.applicantHasJob = applicantHasJob;
        this.applicantHasActiveDebts = applicantHasActiveDebts;
        this.applicantYearsInCurrentJob = applicantYearsInCurrentJob;
    }

    public Integer getLoanAmount() {
        return loanAmount;
    }
    public void setLoanAmount(Integer loanAmount) {
        this.loanAmount = loanAmount;
    }

    public Integer getLoanDuration() {
        return loanDuration;
    }
    public void setLoanDuration(Integer loanDuration) {
        this.loanDuration = loanDuration;
    }

    public Integer getApplicantMonthlyIncomes() {
        return applicantMonthlyIncomes;
    }
    public void setApplicantMonthlyIncomes(Integer applicantMonthlyIncomes) {
        this.applicantMonthlyIncomes = applicantMonthlyIncomes;
    }

    public Integer getApplicantMonthlyExpenses() {
        return applicantMonthlyExpenses;
    }
    public void setApplicantMonthlyExpenses(Integer applicantMonthlyExpenses) {
        this.applicantMonthlyExpenses = applicantMonthlyExpenses;
    }

    public Integer getApplicantAge() {
        return applicantAge;
    }
    public void setApplicantAge(Integer applicantAge) {
        this.applicantAge = applicantAge;
    }

    public Boolean getApplicantHasJob() {
        return applicantHasJob;
    }
    public void setApplicantHasJob(Boolean applicantHasJob) {
        this.applicantHasJob = applicantHasJob;
    }

    public Boolean getApplicantHasActiveDebts() {
        return applicantHasActiveDebts;
    }
    public void setApplicantHasActiveDebts(Boolean applicantHasActiveDebts) {
        this.applicantHasActiveDebts = applicantHasActiveDebts;
    }
    
    public Integer getApplicantYearsInCurrentJob() {
        return applicantYearsInCurrentJob;
    }
    public void setApplicantYearsInCurrentJob(Integer applicantYearsInCurrentJob) {
        this.applicantYearsInCurrentJob = applicantYearsInCurrentJob;
    }

    @Override
    public String toString() {
        return "LoanRequestDataDTO [loanAmount=" + loanAmount + ", loanDuration=" + loanDuration
                + ", applicantMonthlyIncomes=" + applicantMonthlyIncomes + ", applicantMonthlyExpenses="
                + applicantMonthlyExpenses + ", applicantAge=" + applicantAge + ", applicantHasJob=" + applicantHasJob
                + ", applicantHasActiveDebts=" + applicantHasActiveDebts + ", applicantYearsInCurrentJob="
                + applicantYearsInCurrentJob + "]";
    }
}
