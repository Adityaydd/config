local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node

ls.add_snippets('python', {
  s('pygame_setup', {
    t {
      'import pygame',
      '',
      'pygame.init()',
      '',
      'WIDTH, HEIGHT = 800, 600',
      'screen = pygame.display.set_mode((WIDTH, HEIGHT))',
      'pygame.display.set_caption("Basic Pygame Setup")',
      '',
      'clock = pygame.time.Clock()',
      'FPS = 60',
      '',
      'running = True',
      'while running:',
      '    for event in pygame.event.get():',
      '        if event.type == pygame.QUIT:',
      '            running = False',
      '',
      '    screen.fill((30, 30, 30))',
      '    pygame.display.flip()',
      '    clock.tick(FPS)',
      '',
      'pygame.quit()',
    },
  }),
})
