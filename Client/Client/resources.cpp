#include "resources.h"

Resources::Resources(QObject *parent) : QObject(parent)
{

}

Resources::Resources(const Resources &rhs, QObject *parent)
{
    wood = rhs.wood;
    stone= rhs.stone;
    iron = rhs.iron;
    food = rhs.food;
}

Resources& Resources::operator=(const Resources &rhs)
{
    wood = rhs.wood;
    stone= rhs.stone;
    iron = rhs.iron;
    food = rhs.food;
    return *this;
}
