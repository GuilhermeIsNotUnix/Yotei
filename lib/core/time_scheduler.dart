class TimeScheduler {
    final now = DateTime.now();

    DateTime constructDateTime(List<int> givenTime) {
        if(givenTime[0] < now.hour) {
            final targetTime = DateTime(
                now.year,
                now.month,
                now.day + 1,
                givenTime[0],
                givenTime[1],
            )
        } else {
            final targetTime = DateTime(
                now.year,
                now.month,
                now.day,
                givenTime[0],
                givenTime[1],
            )
        }

        return targetTime;
    }

    Duration differenceInSeconds(DateTime targetTime) {
        final timeRemaining = targetTime.difference(now).inSeconds;
        return Duration(seconds: timeRemaining);
    }
}