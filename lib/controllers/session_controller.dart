import 'package:bid_palour/models/bid_model.dart';

class SessionController {
  getLatestSession() {}

  checkSessionParticipantsNumber(String sessionId) {}

  addUserToSession(String email, String sessionId) {}

  createNewSession(String prevSessionID, BidModel bid) {}

  setSessionStatus(String sessionId, String status) {}

  void changeSessionStatus(String sessionID) {}
}
