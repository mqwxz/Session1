using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlTypes;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Session1.Classes
{
    internal class People
    {
        public static int id_people { get; set; }
        public static int people_role  { get; set; }
        public static string people_fio { get; set; }
        public static string people_post { get; set; }
        public static int people_country { get; set; }
        public static DateTime people_dob { get; set; }
        public static string people_phone { get; set; }
        public static string people_pass { get; set; }
        public static string people_gender { get; set; }
        public static int people_direction {  get; set; }
        public static int people_event {  get; set; }
        public static string people_photo { get; set; }
    }
}
