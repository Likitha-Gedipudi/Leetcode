WITH ranked_scores AS (
    SELECT
        student_id,
        subject,
        score,
        exam_date,
        FIRST_VALUE(score) OVER (
            PARTITION BY student_id, subject
            ORDER BY exam_date
        ) AS first_score,
        FIRST_VALUE(score) OVER (
            PARTITION BY student_id, subject
            ORDER BY exam_date DESC
        ) AS latest_score,
        COUNT(*) OVER (
            PARTITION BY student_id, subject
        ) AS exam_count
    FROM Scores
)

SELECT DISTINCT
    student_id,
    subject,
    first_score,
    latest_score
FROM ranked_scores
WHERE exam_count >= 2
  AND latest_score > first_score
ORDER BY student_id, subject;