
class AuthEndpoints {

  static final loginPhoneNumber = 'auth/user/login';
  //   static final myIp = "192.168.147.220:8000";
  static final String checkuser = "en/checkUser/user/";
  static final String signup = "en/register/user/";
  static final String createGroup = "en/register/user/";
  static final String approveRequest =
      "en/approve/request/group/";
  static final String processLoanRequest =
      "en/approve/loan/request/group/";
  static final String processWithdrawRequest =
      "en/approve/withdraw/request/group/";
  static final String payLoan = "en/pay/loan/group/";
  static final String groupTopup = "en/top/up/group/";
  static final String loanSettingUrl = "en/loan/setting/group/";
  static final String memberRolesUrl = "en/member/roles/group/";
  static final String groupSettingUrl =
      "en/general/setting/group/";
  static final String denyRequest = "en/deny/request/group/";
  static final String goalContribute =
      "en/goal/contribution/group/";
  static final String personalGoal = "en/make/goal/deposit/";
  static final String addInvestmentUrl =
      "en/add/investment/group/";
  static final String payOutUrl = "en/pay/out/group/";
  static final String addInterestUrl = "en/add/interest/group/";
  static final String cashOut = "en/investment/cashout/group/";
  static final String payTojoin = "en/pay/to/join/group/";
  static final String SubscriptionSetting =
      "en/subscription/group/";
  static final String groupSubscriptionWithdraw =
      "en/request/withdraw/subscription/group/";
  static final String newGroup = "en/newgroup/group/";
  static final String joinGroup = "en/register/user/";
  static final String sendMessage = "en/register/user/";
  static final String fetchGroups = "en/register/user/";
  static final String apiUrlDeposit = "en/make/deposit/";
  static final String updateProfile = "en/register/user/";
  static final String fetchMessages = "en/register/user/";
  static final String getGroup = "en/getgroup/group/";
  static final String validatePhone = "en/validate/mm/number/";
  static final String requestPayment = "en/request/payment/";
  static final String withdrawPayment = "en/request/withdraw/";
  static final String userWithdrawPayment =
      "en/request/withdraw/user/group/";
  static final String goalWithdrawPayment =
      "en/request/withdraw/goal/group/";
  static final String requestPaymentWebhook =
      "en/requestpaymentshook/";
  static final String getTransaction = "en/get/transaction/";
  static final String verifyOtp = "en/verifyemail/user/";
  static final String passcode = "en/passcode/user/";
  static final String verifyPasscode = "en/verify/passcode/";
  static final String fetchUserDetails = "en/register/user/";
  static final String apiUrlGetInvestmentClasses =
      "en/auth/get/investment/classes/";
  static final apiUrlGetGroupDetails = "en/details/group/";
  static final apiUrlGetGroupStat = "en/stat/group/";
  static final apiUrlGetGroupDetailsNonUser =
      "en/details/join/group/";
  static final String apiUrlGetInvestmentOptions =
      "en/auth/get/investment/options/";
  static final String apiUrlGetInvestmentClassOptions =
      "en/auth/get/investment/class/options/";
  static final String apiUrlGetFundInvestmentClass =
      "en/auth/get/fund/investment/class/";
  static final String apiUrlGetInvestmentOption =
      "en/auth/get/investment/option/";
  static final String apiUrlBankWithdraw =
      "en/make/bank/withdraw/";
  static final String apiUrlMmWithdraw = "en/make/mm/withdraw/";
  static final String apiUrlGoalBankWithdraw =
      "en/make/goal/bank/withdraw/";
  static final String apiUrlGoalMmWithdraw =
      "en/make/goal/mm/withdraw/";
  static final String apiUrlGoalDeposit =
      "en/make/goal/deposit/";
  static final String apiUrlGetDeposit = "en/get/deposit/";
  static final String apiUrlGetUserTrack = "en/get/user/track/";
  static final String apiUrlGetSubStatus =
      "en/get/subscription/status/";
  static final String loanApplication =
      "en/loan/application/group/";
  static final String paySubscription = "en/make/subscription/";
  static final String payGroupSubscription =
      "en/make/subscription/group";
  static final String groupDeposit = "en/general/deposit/group";

  static final String apiUrlGetWithdraw = "en/get/withdraw/";
  static final String apiUrlGetWithdrawFee =
      "en/get/withdraw/fee/";
  static final String apiUrlGetPendingWithdraw =
      "en/get/pending/withdraw/";
  static final String apiUrlGetGoalWithdraw =
      "en/get/goal/withdraw/";
  static final String apiUrlGoal = "en/create/goal/";
  static final String apiUrlGroupGoal = "en/creategroup/goal/";
  static final String editGroup = "en/editgroup/group/";
  static final String editGroupGoal = "en/editgroupgoal/group/";
  static final String addMembers = "en/addmembers/group/";
  static final String editGoal = "en/edit/goal/";
  static final String deleteGoal = "en/delete/goal/";
  static final String deleteGroupGoal = "en/delete/group/goal/";
  static final String deleteGroupPic = "en/delete/group/pic/";
  static final String changeGroupPic = "en/change/group/pic/";
  static final String uploadGoalPhoto =
      "en/auth/upload/goal/photo/";
  static final String apiUrlGetAllFundManagers =
      "en/auth/fundmanagers/all/";
  static final String apiUrlGetGoalDeposit =
      "en/get/deposit/by/goal/";
  static final String apiUrlGetGoal = "en/get/user/goal/";
  static final String apiEmailVerify =
      "en/get/user/verification/";
      static final String verifyCode =
      "en/verify/code/";
  static final String apiResendVerificationEmail =
      "en/resend/verification/email/";
  static final String apiUrlUserProfilePhoto =
      "en/auth/user/upload/profile/photo/";
  static final String apiUrlGoalPhoto =
      "en/auth/upload/goal/photo/";
  static final String apiUrlUserGetProfilePhoto = "static/photo.png";
  static final String apiUrlUserNetWorth =
      "en/auth/user/networth/";
  //static final String login = "en/app/user/login/";
  static final String login = "en/auth/user/login/";
  static final String passcodeLogin = "en/auth/user/passcode/";
  static final String apiUrlUserNextOfKin =
      "en/user/nextOfKin/";
  static final String apiUrlGetNextOfKin = "en/get/nextOfKin/";
  static final String apiUrlGetToken = "en/auth/token/";
  static final String apiUrlGetAuthUser = "en/auth/user/";
  static final String apiUrlRegisterApiUser =
      "en/register/api/user/";
  static final String apiUrlGetAuthUserByEmail =
      "en/auth/user/email/";
  static final String apiUrlAddAuthUserRiskProfile =
      "en/auth/user/riskprofile/";
  static final String apiUrlGetRiskProfile =
      "en/auth/get/riskprofile/";
  static final String checkPasswordEmail = "en/password/reset/";
    static final String passwordResetLink = "en/password/reset/link/";
  static final String apiUrlPasswordReset = "/reset/password/";
  static final String changeUserPassword =
      "en/auth/user/change/password/";
  static final String apiUrlGetUbaseUrlification =
      "en/get/verification/";
  static final String apiUrlGetRiskAnalysisPercentages =
      "en/get/risk/analysis/percentages/";
  static final String apiUrlResetPassword = "reset/password/";
  static final String profilePhoto =
      "/media/profile/default_picture.jpg";
  static final String goalPhoto = "media/goal/default_picture.jpg";
  static final String apiUrlGetInvestmentWithdraws =
      "en/get/investment/withdraws/";
  static final String apiUrlGetUserBanks =
      "en/auth/user/banks/";
  static final String apiDocs = "developers.cyanase.app";
  static final String withdrawFromGroup =
      "en/withdraw/subscription/group/";
  static final String apiUrlGetNotificationSettings =
      "en/notifications/settings/";
  static final String apiUrlUpdateNotificationSettings =
      "en/auth/user/notification/settings/";

  static final String allTransactions =
      "en/user/top-transactions/";
}
