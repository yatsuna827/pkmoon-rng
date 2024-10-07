fn main {
  let lcg = @pk_rng.Lcg32(0xBEEFCAFE).to_ref()
  lcg.advance(n=12345)
  println(lcg.to_string())
}
