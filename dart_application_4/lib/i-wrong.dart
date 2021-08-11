abstract class IHeroAbility {
  void heal();
  void castMagic();
  void stealMoney();
}

abstract class Hero implements IHeroAbility {
  void regularAttack();
}

// !---------------------------------------------

class Thief extends Hero {
  @override
  void castMagic() {
    // do nothing
  }

  @override
  void heal() {
    // do nothing
  }

  @override
  void regularAttack() {
    // attack
  }

  @override
  void stealMoney() {
    // ...
  }
}

// !---------------------------------------------------
class WhiteMage extends Hero {
  @override
  void castMagic() {
    // ...
  }

  @override
  void heal() {
    // healing
  }

  @override
  void regularAttack() {
    // attack
  }

  @override
  void stealMoney() {
    // do nothing
  }
}

// !--------------------------------------------------------
class BlackMage extends Hero {
  @override
  void castMagic() {
    // ...
  }

  @override
  void heal() {
    // do nothing
  }

  @override
  void regularAttack() {
    // attack
  }

  @override
  void stealMoney() {
    // do nothing
  }
}
