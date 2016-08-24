using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
///Class1 的摘要说明
/// </summary>
public class Class1
{
    public class NewsModel
    {
        private int id;

        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        private string title;

        public string Title
        {
            get { return title; }
            set { title = value; }
        }
        private string content;

        public string Content
        {
            get { return content; }
            set { content = value; }
        }
        //private string categories;

        //public string Categories
        //{
        //    get { return categories; }
        //    set { categories = value; }
        //}
        private string type;

        public string Type
        {
            get { return type; }
            set { type = value; }
        }
        private string author;

        public string Author
        {
            get { return author; }
            set { author = value; }
        }
        private DateTime issueDate;

        public DateTime IssueDate
        {
            get { return issueDate; }
            set { issueDate = value; }
        }
    }
}