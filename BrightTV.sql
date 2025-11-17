SELECT
B.Name,B.Surname,B.Email,B.Gender,B.Race,B.Age,B.Province,B.SOCIAL_MEDIA_HANDLE,
A.UserID,A.Channel2,A.RecordDate2,A.Duration2,

    -- Convert UTC to timestamp
    TO_TIMESTAMP_NTZ(A.recorddate2, 'YYYY/MM/DD HH24:MI') AS utc_datetime,

    -- South Africa time = UTC + 2 hours
    DATEADD(hour, 2, TO_TIMESTAMP_NTZ(A.recorddate2, 'YYYY/MM/DD HH24:MI')) AS SA_datetime,

    -- South Africa Date
    TO_DATE(DATEADD(hour, 2, TO_TIMESTAMP_NTZ(A.recorddate2, 'YYYY/MM/DD HH24:MI'))) AS SA_date,

    -- South African time
    TO_VARCHAR(DATEADD(hour, 2, TO_TIMESTAMP_NTZ(A.recorddate2, 'YYYY/MM/DD HH24:MI')), 'HH24:MI:SS') AS SA_time,

    -- Duration column already formatted
    duration2
    --Joining userprofile dataset& profile set
FROM brighttv_viewership_dataset A
FULL JOIN BRIGHTTV_USERPROFILES_DATASET B
ON A.USERID=B.USERID;
