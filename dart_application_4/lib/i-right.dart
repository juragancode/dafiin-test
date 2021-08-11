abstract class Hero {
  void regularAttack();
}

// !-------------------------
abstract class IMagicCaster {
  void castMagic();
}

abstract class IHealer {
  void heal();
}

abstract class IStealer {
  void stealMoney();
}

// !-------------------------
class Thief extends Hero implements IStealer {
  @override
  void regularAttack() {
    // Hit
  }

  @override
  void stealMoney() {
    // Stealing
  }
}

// !-------------------------
class WhiteMage extends Hero implements IHealer, IMagicCaster {
  @override
  void castMagic() {
    // Magic Spell
  }

  @override
  void heal() {
    // Healing..
  }

  @override
  void regularAttack() {
    // magic attack
  }
}

// !-------------------------
class BlackMage extends Hero implements IMagicCaster {
  @override
  void castMagic() {
    // Black Magic Spell
  }

  @override
  void regularAttack() {
    // magic attack
  }
}
// !-------------------------