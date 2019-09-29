using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Encryption
/// </summary>
public class Encryption
{
    public Encryption()
    {
        //
        // TODO: Add constructor logic here
        //
    }
/*
    public String CreateSalt(int size)
    {
        var rng = new System.Security.Cryptography.RNGCryptoServiceProvider();
        var buff = new byte[size];
        rng.GetBytes(buff);
        return Convert.ToBase64String(buff);
    }
*/
    public String GenerateSHA256Hash(String input)
    {
        byte[] bytes = System.Text.Encoding.UTF8.GetBytes(input);
        System.Security.Cryptography.SHA256Managed sha256hashstring = new System.Security.Cryptography.SHA256Managed();
        byte[] hash = sha256hashstring.ComputeHash(bytes);
        return Convert.ToBase64String(hash);

    }

}