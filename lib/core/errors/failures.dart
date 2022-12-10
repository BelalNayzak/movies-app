abstract class Failure {}

// film

class NoInternetFailure extends Failure {}

class EmptyCacheFailure extends Failure {}

class ServerFailure extends Failure {}

// auth

class NotRegisteredFailure extends Failure {} // wrong email

class AlreadyRegisteredFailure extends Failure {} // plz login !

class WrongPassFailure extends Failure {} // wrong pass
