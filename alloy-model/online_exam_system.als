module OnlineExamSystem

//--------------------------------------
// Signatures
//--------------------------------------

sig Student {}

sig Exam {}

sig Question {}

sig Answer {}

sig Submission {
    student : one Student,
    exam    : one Exam,
    answers : set Answer
}

//--------------------------------------
// System
//--------------------------------------

one sig OnlineExamSystem {

    registeredStudents : set Student,

    loggedInStudents   : set Student,

    activeExams        : Student -> lone Exam,

    submittedExams     : set Submission,

    examQuestions      : Exam -> set Question
}

//--------------------------------------
// Facts (Constraints)
//--------------------------------------

fact LoginConstraint {

    all s : Student |

        s in OnlineExamSystem.loggedInStudents
        implies
        s in OnlineExamSystem.registeredStudents
}

fact ActiveExamConstraint {

    all s : Student |

        some OnlineExamSystem.activeExams[s]
        implies
        s in OnlineExamSystem.loggedInStudents
}

fact OneSubmissionRule {

    all s : Student, e : Exam |

        lone sub : Submission |
            sub.student = s and
            sub.exam = e
}

fact SubmissionAfterExamStart {

    all sub : Submission |

        some OnlineExamSystem.activeExams[sub.student]
}

fact ExamMustContainQuestions {

    all e : Exam |

        some OnlineExamSystem.examQuestions[e]
}

//--------------------------------------
// WRONG ASSERTION
// (This will produce counterexample)
//--------------------------------------

assert EveryStudentLoggedIn {

    all s : Student |

        s in OnlineExamSystem.loggedInStudents
}

//--------------------------------------
// Check Counterexample
//--------------------------------------

check EveryStudentLoggedIn for 5

//--------------------------------------
// Predicate
//--------------------------------------

pred ShowSystem {}

run ShowSystem for 5
