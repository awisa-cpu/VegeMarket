//registeration exceptions
class EmailAlreadyInUseException implements Exception {}

class InvalidEmailException implements Exception {}

class WeakPasswordException implements Exception {}

//login exceptions
class UserNotFoundException implements Exception {}

class WrongPasswordException implements Exception {}

class UserDisabledException implements Exception {}

class GenericAuthException implements Exception {}

class UserNotLoggedInException implements Exception {}

