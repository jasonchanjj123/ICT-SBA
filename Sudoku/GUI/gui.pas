program gui;
uses fano;  

var
    appInstance : IWebApplication;

begin
    (*!-----------------------------------------------
     * Bootstrap application
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *------------------------------------------------*)
    appInstance := TCgiWebApplication.create(
        TMyAppServiceProvider.create(),
        TMyAppRoutes.create()
    );
    appInstance.run();
end.