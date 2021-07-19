using RestSharp;
using System;
using System.Collections.Generic;
using System.Net;
using Newtonsoft.Json;

namespace RUCKUS_Cloud
{
    public partial class Default : System.Web.UI.Page
    {
        public RestClient client = new RestClient("http://ruckus.cloud");

        protected void Page_Load(object sender, EventArgs e)
        {
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
        }

        protected void getToken_Click(object sender, EventArgs e)
        {
            client.CookieContainer = new System.Net.CookieContainer();
            client.UseJson();
            var request = new RestRequest("token", Method.POST);
            request.RequestFormat = DataFormat.Json;
            request.AddJsonBody(new
            {
                username = txtEmail.Text,
                password = txtPassword.Text
            });
            IRestResponse response = client.Execute(request);
            dynamic api = Newtonsoft.Json.Linq.JObject.Parse(response.Content);
            Session["API-KEY"] = api["API-KEY"].Value;
            Session["tenantId"] = api["tenantId"].Value;
            txtToken.Text = "token: " + api["API-KEY"].Value + System.Environment.NewLine + "tenantId: " + api["tenantId"].Value;
        }

        protected void getVenues_Click(object sender, EventArgs e)
        {
            var request = new RestRequest("api/tenant/" + Session["tenantId"] + "/venue", Method.GET);
            request.AddCookie("API-KEY", Session["API-KEY"].ToString());
            IRestResponse response = client.Execute(request);
            txtGetVenues.Text = response.Content;
        }

        protected void getNetworks_Click(object sender, EventArgs e)
        {
            var request = new RestRequest("api/tenant/" + Session["tenantId"] + "/wifi/network", Method.GET);
            request.AddCookie("API-KEY", Session["API-KEY"].ToString());
            IRestResponse response = client.Execute(request);
            txtGetNetworks.Text = response.Content;
        }

        protected void createPass_Click(object sender, EventArgs e)
        {
            var request = new RestRequest("api/tenant/" + Session["tenantId"] + "/wifi/guest-user", Method.POST);
            request.AddCookie("API-KEY", Session["API-KEY"].ToString());
            request.RequestFormat = DataFormat.Json;

            Body root = new Body()
            {
                deliveryMethods = new List<string>() { "PRINT" },
                expiration = new Expiration()
                {
                    activationType = "Creation",
                    duration = 60,
                    unit = "Minute",
                },
                maxDevices = 3,
                mobilePhoneNumber = txtPhone.Text,
                name = txtName.Text,
                networkId = txtNetworkId.Text,
            };

            List<Body> wrapperList = new List<Body>();
            wrapperList.Add(root);
            //string json = JsonConvert.SerializeObject(wrapperList);
            request.AddJsonBody(wrapperList);
            IRestResponse response = client.Execute(request);
            txtCreatePass.Text = response.Content;
        }

        public class Body
        {
            public List<string> deliveryMethods { get; set; }
            public Expiration expiration { get; set; }
            public int maxDevices { get; set; }
            public string mobilePhoneNumber { get; set; }
            public string name { get; set; }
            public string networkId { get; set; }
        }

        public class Expiration
        {
            public string activationType { get; set; }
            public int duration { get; set; }
            public string unit { get; set; }
        }
    }
}