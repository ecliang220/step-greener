/// PointSystem tracks the total number of points a user has
class PointSystem {
  int _totalPoints = 0; 

  /// Getter for totalPoints in the system.
  get totalPoints => _totalPoints;

  /// Converts the number of steps taken to points.
  /// 
  /// Returns the points given steps.
  int stepsToPoints( int steps ) {
    return steps ~/ 1000;
  }
  /// Converts the number of steps taken to points and adds them to total points.
  /// 
  /// Returns true if points are added successfully, and false otherwise.
  bool addPointsFromSteps( int steps ) {
    _totalPoints += stepsToPoints(steps);
    return true;
  }

  /// Adds the number of points earned to the totalPoints in the system.
  ///
  /// Returns the new total for the number of points in the system after adding points earned.
  int earnPoints( int pointedEarned ) {
    return _totalPoints += pointedEarned;
  }

  /// Removes the number of points redeemed from the totalPoints in the system.
  /// 
  /// Returns the new total for the number of points in the system after point redemption.
  int redeemPoints( int pointsRedeemed ) {
    return _totalPoints -= pointsRedeemed;
  }

  /// For App Building evaluation purposes.
  /// Approximates the number of points to a dollar value.
  /// 
  /// Returns the given number of points as an approximate dollar value.
  double approxDollarVal( int points ) {
    // 1 points ~$0.05
    return points * 0.05;
  }
}