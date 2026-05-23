class TimeScheduler {
    static DateTime constructDateTime(List<int> givenTime) {
        final now = DateTime.now();

        var targetTime = DateTime(
            now.year,
            now.month,
            now.day,
            givenTime[0],
            givenTime[1],
        );

        if(targetTime.isBefore(now)) {
            targetTime = DateTime(
                now.year,
                now.month,
                now.day + 1,
                givenTime[0],
                givenTime[1],
            );
        }

        return targetTime;
    }

    Duration calculateRemainingTime(DateTime targetTime) {
        final now = DateTime.now();

        return targetTime.difference(now);
    }
}