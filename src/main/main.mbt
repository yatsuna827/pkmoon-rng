fn main {
  let lcg = @pk_rng.Lcg32(0x002E5B77).to_ref()
  let os = @togepii.OutskirtStand::new()
  for i = 0; i < 100; i = i + 1 {
    println("\{i}[F] \{lcg} \{os}")
    os.count_up(lcg)
  }
}
