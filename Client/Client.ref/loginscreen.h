#ifndef LOGINSCREEN_H
#define LOGINSCREEN_H

#include <QDialog>
#include <QLineEdit>
namespace Ui {
class LoginScreen;
}

class LoginScreen : public QDialog
{
    Q_OBJECT

public:
    explicit LoginScreen(QWidget *parent = 0);
    ~LoginScreen();
    const QString getUsername() const;

private:
    Ui::LoginScreen *ui;
};

#endif // LOGINSCREEN_H
