[STUDENT, EXAM, QUESTION, ANSWER]

OnlineExamSystem
==========================================

students        : ℙ STUDENT
loggedIn        : ℙ STUDENT
attemptingExam  : STUDENT ↔ EXAM
submittedExam   : STUDENT ↔ EXAM
examQuestions   : EXAM ↔ QUESTION
studentAnswers  : STUDENT ↔ ANSWER
deadlinePassed  : EXAM → BOOL

------------------------------------------
Invariants
------------------------------------------

loggedIn ⊆ students

dom attemptingExam ⊆ loggedIn

dom submittedExam ⊆ loggedIn

∀ s : STUDENT; e : EXAM •
(s,e) ∈ submittedExam ⇒
(s,e) ∉ attemptingExam

∀ s : STUDENT; e : EXAM •
#({e} ▹ submittedExam ▹ {s}) ≤ 1

∀ s : STUDENT; e : EXAM •
(s,e) ∈ submittedExam ⇒
deadlinePassed(e) = false

==========================================
Initial State
==========================================

InitOnlineExamSystem
==========================================

OnlineExamSystem

------------------------------------------

students = ∅
loggedIn = ∅
attemptingExam = ∅
submittedExam = ∅
examQuestions = ∅
studentAnswers = ∅

==========================================
Login Operation
==========================================

Login
==========================================

Δ OnlineExamSystem

student? : STUDENT

------------------------------------------

student? ∈ students

student? ∉ loggedIn

------------------------------------------

loggedIn' = loggedIn ∪ {student?}

students' = students

attemptingExam' = attemptingExam

submittedExam' = submittedExam

examQuestions' = examQuestions

studentAnswers' = studentAnswers

deadlinePassed' = deadlinePassed

==========================================
Start Exam Operation
==========================================

StartExam
==========================================

Δ OnlineExamSystem

student? : STUDENT
exam?    : EXAM

------------------------------------------

student? ∈ loggedIn

(student?,exam?) ∉ submittedExam

deadlinePassed(exam?) = false

------------------------------------------

attemptingExam' =
attemptingExam ∪ {(student?,exam?)}

students' = students

loggedIn' = loggedIn

submittedExam' = submittedExam

examQuestions' = examQuestions

studentAnswers' = studentAnswers

deadlinePassed' = deadlinePassed

==========================================
Submit Exam Operation
==========================================

SubmitExam
==========================================

Δ OnlineExamSystem

student? : STUDENT
exam?    : EXAM
answer?  : ANSWER

------------------------------------------

(student?,exam?) ∈ attemptingExam

(student?,exam?) ∉ submittedExam

deadlinePassed(exam?) = false

------------------------------------------

submittedExam' =
submittedExam ∪ {(student?,exam?)}

attemptingExam' =
attemptingExam \ {(student?,exam?)}

studentAnswers' =
studentAnswers ∪ {(student?,answer?)}

students' = students

loggedIn' = loggedIn

examQuestions' = examQuestions

deadlinePassed' = deadlinePassed

==========================================
Logout Operation
==========================================

Logout
==========================================

Δ OnlineExamSystem

student? : STUDENT

------------------------------------------

student? ∈ loggedIn

------------------------------------------

loggedIn' = loggedIn \ {student?}

students' = students

attemptingExam' = attemptingExam

submittedExam' = submittedExam

examQuestions' = examQuestions

studentAnswers' = studentAnswers

deadlinePassed' = deadlinePassed
