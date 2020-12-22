const loyappsRest = 'loyapps-rest/v0';
const homeRest = 'homerest/v0';

export const absenceNano = {
  nanoDonationURL: loyappsRest + '/NanoDonationSetupFoundTbl',
  nanoDonationPOSTJSON: {
    name: 'getNanoDonationFoundations',
  },
};
export const balanceDashboard = {
  balanceDashboardUrl: loyappsRest + '/BalanceTbl',
  balancePOSTJSON: {
    name: 'getCurrentUserBalances',
  },
  balanceDashboardSetUpUrl: loyappsRest + '/BalanceSetupTbl',
  balanceSetUpPOSTJSON: {
    name: 'checkCurrentUserHasBalanceSetup',
  },
};
export const absenceValidate = {
  absenceValidateUrl: loyappsRest + '/AbsenceTaskListView',
  absenceValidatePOSTJSON: {
    name: 'getNumberOfTasksForCurrentUser',
  },
};
export const favorite = {
  favoriteServiceUrl: homeRest + '/UserProfileTbl/;jsessionid=null?onlyData=true&fields=FavoriteWidgets',
  updateFavoriteUrl: homeRest + '/v0/updateFavoriteWidgets',
  favoriteUpdatePOSTJSON: {
    name: 'updateFavoriteWidgets',
  },
};
export const nanoDonation = {
  nanoDonationServiceUrl: loyappsRest + '/NanoDonationEeSetupTbl',
  nanoDonationPOSTJSON: {
    name: 'getLatestNanoDonationEeSetup',
  },
};
export const whoNotHere = {
  whoNotHereServiceUrl: loyappsRest + '/TeamEmployeesView',
  whoNotHerePOSTJSON: {
    name: 'getTeamAbsences',
  },
};
export const nextAbsence = {
  nextAbsenceServiceUrl: loyappsRest + '/AbsenceTbl',
  nextAbsencePOSTJSON: {
    name: 'getNextAbsences',
  },
};
export const payslips = {
  payslipsServiceUrl: loyappsRest + '/PayslipsTbl',
  payslipsPOSTJSON: {
    name: 'getPayslips',
  },
};
export const user = {
  userServiceUrl: homeRest + '/UserProfileTbl',
  userPOSTJSON: {
    name: 'getUserDetails',
  },
  employeeID: {
    name: 'getUserEmployeeId',
  },
  userLang: {
    name: 'getUserLanguage',
  },
  availableApplications: {
    name: 'getAvailableApplications',
  },
};
export const validateTimeSheet = {
  validateTimeSheetServiceUrl: loyappsRest + '/TimesheetTbl',
  validateTimeSheetPOSTJSON: {
    name: 'getNumberOfTasksForCurrentUser',
  },
};
export class Result {
  result: string;
  constructor() {
    this.result = '';
  }
}
