pub(all) type Lcg32Ref Ref[Lcg32]

pub fn to_ref(self : Lcg32) -> Lcg32Ref {
  Lcg32Ref(Ref::new(self))
}

pub fn advance(self : Lcg32Ref, n~ : UInt = 1) -> Unit {
  match n {
    0 => Unit::default()
    1 => self._.update(Lcg32::next)
    n => self._.update(fn(lcg) { lcg.jump(n) })
  }
}

pub fn seed(self : Lcg32Ref) -> UInt {
  self._.val._
}

pub fn to_string(self : Lcg32Ref) -> String {
  self._.val.to_string()
}

pub fn get_rand(self : Lcg32Ref, m?: Int) -> UInt {
  match m {
    None => self..advance()._.val._ >> 16
    Some(n) => self..advance()._.val._ >> (16 % n)
  }
}

pub fn get_index(self : Lcg32Ref, from~ : UInt = 0) -> UInt {
  self._.val.get_index(from~)
}

test "jump" {
  let lcg = Lcg32(0).to_ref()
  lcg.advance(n=12345678)
  assert_eq!(lcg.seed(), 0x183c26f6)
}

test "jump" {
  let lcg1 = Lcg32(0).to_ref()
  for i = 0; i < 1000; i = i + 1 {
    lcg1.advance()
  }
  let lcg2 = Lcg32(0).to_ref()
  lcg2.advance(n=1000)
  assert_eq!(lcg1.seed(), lcg2.seed())
}
