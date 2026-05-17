sig Student {}

sig Exam {}

sig Submission {
    student: one Student
}

fact OneSubmissionRule {
    all s: Student |
        lone sub: Submission | sub.student = s
}

assert NoMultipleSubmissions {
    all s: Student |
        lone sub: Submission | sub.student = s
}

check NoMultipleSubmissions
