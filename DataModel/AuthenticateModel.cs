﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using System.Text;
using System.Threading.Tasks;

namespace DataModel
{
    public class AuthenticateModel
    {
        [Required]
        public string Username { get; set; }

        [Required] 
        public string Password { get; set; }
    }

    public class AppSettings
    {
        public string Secret { get; set; }
    }
}
