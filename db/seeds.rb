post = Post.create({
  title: 'Thanks Impact!',
  author: 'Emerald',
  body: 'Nebula Force, Go! would like to heartily thank Impact Theatre for helping further the intergalactic stellarness that is Nebula Force, Go!'
})
post = Post.create({
  title: 'About Nebula Force, Go!',
  author: 'Emerald',
  body: "Nebula Force, Go! captures the trials and tribulations of the universe's brokenhearted would-be dinosaurs, spaceships yearning for adventure, and flesh loving surfer kaiju in songs that delight and entertain. Channeling the mighty intergalactic power that has been bestowed upon them, Nebula Force, Go!'s unique alt-nerdative style creates a brain-crushing singularity at the intersection of geek and music."
})
user = User.create({
  username: 'emerald',
  password: ENV['PASSWORD']
})