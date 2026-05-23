class TimeParser {
    static List<int> parseTime(String givenTime) {
        if(givenTime.isEmpty)
            throw ArgumentError('Given time is empty');
        
        if(!givenTime.contains(':'))
            throw ArgumentError('Time format is invalid.');
        final timeParts = givenTime.split(':');

        if(timeParts.length != 2)
            throw ArgumentError('Time format is invalid.');
        final hours = int.tryParse(timeParts[0]);
        final minutes = int.tryParse(timeParts[1]);

        if(hours == null || minutes == null)
            throw ArgumentError('Time contains non-numeric values or int conversion failed.');
        
        if(hours < 0 || hours > 23)
            throw ArgumentError('Hours is invalid.');
        if(minutes < 0 || minutes > 59)
            throw ArgumentError('Minutes is invalid.');
        
        return [hours, minutes];
    }
}