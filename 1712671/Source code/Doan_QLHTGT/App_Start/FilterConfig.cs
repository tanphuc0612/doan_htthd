﻿using System.Web;
using System.Web.Mvc;

namespace Doan_QLHTGT
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
