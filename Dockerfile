FROM tomcat:8
LABEL author = Naresh
ADD https://war-jar-vn.s3.amazonaws.com/gameoflife.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"] 

