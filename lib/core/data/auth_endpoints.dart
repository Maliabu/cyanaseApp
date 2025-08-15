import 'package:cyanaseapp/core/data/api_endpoints.dart';

class AuthEndpoints {
  static final baseUrl = ApiEndpoints.baseUrl;

  static final loginPhoneNumber = '$baseUrl/auth/user/login';
  //   static final myIp = "192.168.147.220:8000";
  static final String checkuser = "$baseUrl/api/v1/en/checkUser/user/";
  static final String signup = "$baseUrl/api/v1/en/register/user/";
  static final String createGroup = "$baseUrl/api/v1/en/register/user/";
  static final String approveRequest =
      "$baseUrl/api/v1/en/approve/request/group/";
  static final String processLoanRequest =
      "$baseUrl/api/v1/en/approve/loan/request/group/";
  static final String processWithdrawRequest =
      "$baseUrl/api/v1/en/approve/withdraw/request/group/";
  static final String payLoan = "$baseUrl/api/v1/en/pay/loan/group/";
  static final String groupTopup = "$baseUrl/api/v1/en/top/up/group/";
  static final String loanSettingUrl = "$baseUrl/api/v1/en/loan/setting/group/";
  static final String memberRolesUrl = "$baseUrl/api/v1/en/member/roles/group/";
  static final String groupSettingUrl =
      "$baseUrl/api/v1/en/general/setting/group/";
  static final String denyRequest = "$baseUrl/api/v1/en/deny/request/group/";
  static final String goalContribute =
      "$baseUrl/api/v1/en/goal/contribution/group/";
  static final String personalGoal = "$baseUrl/api/v1/en/make/goal/deposit/";
  static final String addInvestmentUrl =
      "$baseUrl/api/v1/en/add/investment/group/";
  static final String payOutUrl = "$baseUrl/api/v1/en/pay/out/group/";
  static final String addInterestUrl = "$baseUrl/api/v1/en/add/interest/group/";
  static final String cashOut = "$baseUrl/api/v1/en/investment/cashout/group/";
  static final String payTojoin = "$baseUrl/api/v1/en/pay/to/join/group/";
  static final String SubscriptionSetting =
      "$baseUrl/api/v1/en/subscription/group/";
  static final String groupSubscriptionWithdraw =
      "$baseUrl/api/v1/en/request/withdraw/subscription/group/";
  static final String newGroup = "$baseUrl/api/v1/en/newgroup/group/";
  static final String joinGroup = "$baseUrl/api/v1/en/register/user/";
  static final String sendMessage = "$baseUrl/api/v1/en/register/user/";
  static final String fetchGroups = "$baseUrl/api/v1/en/register/user/";
  static final String apiUrlDeposit = "$baseUrl/api/v1/en/make/deposit/";
  static final String updateProfile = "$baseUrl/api/v1/en/register/user/";
  static final String fetchMessages = "$baseUrl/api/v1/en/register/user/";
  static final String getGroup = "$baseUrl/api/v1/en/getgroup/group/";
  static final String validatePhone = "$baseUrl/api/v1/en/validate/mm/number/";
  static final String requestPayment = "$baseUrl/api/v1/en/request/payment/";
  static final String withdrawPayment = "$baseUrl/api/v1/en/request/withdraw/";
  static final String userWithdrawPayment =
      "$baseUrl/api/v1/en/request/withdraw/user/group/";
  static final String goalWithdrawPayment =
      "$baseUrl/api/v1/en/request/withdraw/goal/group/";
  static final String requestPaymentWebhook =
      "$baseUrl/api/v1/en/requestpaymentshook/";
  static final String getTransaction = "$baseUrl/api/v1/en/get/transaction/";
  static final String verifyOtp = "$baseUrl/api/v1/en/verifyemail/user/";
  static final String passcode = "$baseUrl/api/v1/en/passcode/user/";
  static final String verifyPasscode = "$baseUrl/api/v1/en/verify/passcode/";
  static final String fetchUserDetails = "$baseUrl/api/v1/en/register/user/";
  static final String apiUrlGetInvestmentClasses =
      "$baseUrl/api/v1/en/auth/get/investment/classes/";
  static final apiUrlGetGroupDetails = "$baseUrl/api/v1/en/details/group/";
  static final apiUrlGetGroupStat = "$baseUrl/api/v1/en/stat/group/";
  static final apiUrlGetGroupDetailsNonUser =
      "$baseUrl/api/v1/en/details/join/group/";
  static final String apiUrlGetInvestmentOptions =
      "$baseUrl/api/v1/en/auth/get/investment/options/";
  static final String apiUrlGetInvestmentClassOptions =
      "$baseUrl/api/v1/en/auth/get/investment/class/options/";
  static final String apiUrlGetFundInvestmentClass =
      "$baseUrl/api/v1/en/auth/get/fund/investment/class/";
  static final String apiUrlGetInvestmentOption =
      "$baseUrl/api/v1/en/auth/get/investment/option/";
  static final String apiUrlBankWithdraw =
      "$baseUrl/api/v1/en/make/bank/withdraw/";
  static final String apiUrlMmWithdraw = "$baseUrl/api/v1/en/make/mm/withdraw/";
  static final String apiUrlGoalBankWithdraw =
      "$baseUrl/api/v1/en/make/goal/bank/withdraw/";
  static final String apiUrlGoalMmWithdraw =
      "$baseUrl/api/v1/en/make/goal/mm/withdraw/";
  static final String apiUrlGoalDeposit =
      "$baseUrl/api/v1/en/make/goal/deposit/";
  static final String apiUrlGetDeposit = "$baseUrl/api/v1/en/get/deposit/";
  static final String apiUrlGetUserTrack = "$baseUrl/api/v1/en/get/user/track/";
  static final String apiUrlGetSubStatus =
      "$baseUrl/api/v1/en/get/subscription/status/";
  static final String loanApplication =
      "$baseUrl/api/v1/en/loan/application/group/";
  static final String paySubscription = "$baseUrl/api/v1/en/make/subscription/";
  static final String payGroupSubscription =
      "$baseUrl/api/v1/en/make/subscription/group";
  static final String groupDeposit = "$baseUrl/api/v1/en/general/deposit/group";

  static final String apiUrlGetWithdraw = "$baseUrl/api/v1/en/get/withdraw/";
  static final String apiUrlGetWithdrawFee =
      "$baseUrl/api/v1/en/get/withdraw/fee/";
  static final String apiUrlGetPendingWithdraw =
      "$baseUrl/api/v1/en/get/pending/withdraw/";
  static final String apiUrlGetGoalWithdraw =
      "$baseUrl/api/v1/en/get/goal/withdraw/";
  static final String apiUrlGoal = "$baseUrl/api/v1/en/create/goal/";
  static final String apiUrlGroupGoal = "$baseUrl/api/v1/en/creategroup/goal/";
  static final String editGroup = "$baseUrl/api/v1/en/editgroup/group/";
  static final String editGroupGoal = "$baseUrl/api/v1/en/editgroupgoal/group/";
  static final String addMembers = "$baseUrl/api/v1/en/addmembers/group/";
  static final String editGoal = "$baseUrl/api/v1/en/edit/goal/";
  static final String deleteGoal = "$baseUrl/api/v1/en/delete/goal/";
  static final String deleteGroupGoal = "$baseUrl/api/v1/en/delete/group/goal/";
  static final String deleteGroupPic = "$baseUrl/api/v1/en/delete/group/pic/";
  static final String changeGroupPic = "$baseUrl/api/v1/en/change/group/pic/";
  static final String uploadGoalPhoto =
      "$baseUrl/api/v1/en/auth/upload/goal/photo/";
  static final String apiUrlGetAllFundManagers =
      "$baseUrl/api/v1/en/auth/fundmanagers/all/";
  static final String apiUrlGetGoalDeposit =
      "$baseUrl/api/v1/en/get/deposit/by/goal/";
  static final String apiUrlGetGoal = "$baseUrl/api/v1/en/get/user/goal/";
  static final String apiEmailVerify =
      "$baseUrl/api/v1/en/get/user/verification/";
  static final String apiResendVerificationEmail =
      "$baseUrl/api/v1/en/resend/verification/email/";
  static final String apiUrlUserProfilePhoto =
      "$baseUrl/api/v1/en/auth/user/upload/profile/photo/";
  static final String apiUrlGoalPhoto =
      "$baseUrl/api/v1/en/auth/upload/goal/photo/";
  static final String apiUrlUserGetProfilePhoto = "$baseUrl/static/photo.png";
  static final String apiUrlUserNetWorth =
      "$baseUrl/api/v1/en/auth/user/networth/";
  //static final String login = "$baseUrl/api/v1/en/app/user/login/";
  static final String login = "$baseUrl/api/v1/en/auth/user/login/";
  static final String passcodeLogin = "$baseUrl/api/v1/en/auth/user/passcode/";
  static final String apiUrlUserNextOfKin =
      "$baseUrl/api/v1/en/user/nextOfKin/";
  static final String apiUrlGetNextOfKin = "$baseUrl/api/v1/en/get/nextOfKin/";
  static final String apiUrlGetToken = "$baseUrl/api/v1/en/auth/token/";
  static final String apiUrlGetAuthUser = "$baseUrl/api/v1/en/auth/user/";
  static final String apiUrlRegisterApiUser =
      "$baseUrl/api/v1/en/register/api/user/";
  static final String apiUrlGetAuthUserByEmail =
      "$baseUrl/api/v1/en/auth/user/email/";
  static final String apiUrlAddAuthUserRiskProfile =
      "$baseUrl/api/v1/en/auth/user/riskprofile/";
  static final String apiUrlGetRiskProfile =
      "$baseUrl/api/v1/en/auth/get/riskprofile/";
  static final String checkPasswordEmail = "$baseUrl/api/v1/en/password/reset/";
  static final String apiUrlPasswordReset = "$baseUrl/reset/password/";
  static final String changeUserPassword =
      "$baseUrl/api/v1/en/auth/user/change/password/";
  static final String apiUrlGetUbaseUrlification =
      "$baseUrl/api/v1/en/get/verification/";
  static final String apiUrlGetRiskAnalysisPercentages =
      "$baseUrl/api/v1/en/get/risk/analysis/percentages/";
  static final String apiUrlResetPassword = "$baseUrl/reset/password/";
  static final String profilePhoto =
      "$baseUrl/media/profile/default_picture.jpg";
  static final String goalPhoto = "$baseUrl/media/goal/default_picture.jpg";
  static final String apiUrlGetInvestmentWithdraws =
      "$baseUrl/api/v1/en/get/investment/withdraws/";
  static final String apiUrlGetUserBanks =
      "$baseUrl/api/v1/en/auth/user/banks/";
  static final String apiDocs = "developers.cyanase.app";
  static final String withdrawFromGroup =
      "$baseUrl/api/v1/en/withdraw/subscription/group/";
  static final String apiUrlGetNotificationSettings =
      "$baseUrl/api/v1/en/notifications/settings/";
  static final String apiUrlUpdateNotificationSettings =
      "$baseUrl/api/v1/en/auth/user/notification/settings/";

  static final String allTransactions =
      "$baseUrl/api/v1/en/user/top-transactions/";
}
