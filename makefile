VIM_TARGET_DIR     = "${HOME}/.vim"
TMUX_TARGET_DIR    = "${HOME}/.config/tmux"
KANATA_TARGET_DIR  = "${HOME}/.config/kanata"
SYSTEMD_TARGET_DIR = "${HOME}/.config/systemd/user"

avim:
	mkdir -p $(VIM_TARGET_DIR)
	stow --restow --dir=program --target=$(VIM_TARGET_DIR) vim

rvim:
	stow --delete --dir=program --target=$(VIM_TARGET_DIR) vim
	rm -rf $(VIM_TARGET_DIR)

atmux:
	mkdir -p $(TMUX_TARGET_DIR)
	stow --restow --dir=program --target=$(TMUX_TARGET_DIR) tmux

rtmux:
	stow --delete --dir=program --target=$(TMUX_TARGET_DIR) tmux
	rm -rf $(TMUX_TARGET_DIR)

akanata:
	mkdir -p $(KANATA_TARGET_DIR)
	stow --restow --dir=program --target=$(KANATA_TARGET_DIR) kanata

rkanata:
	stow --delete --dir=program --target=$(KANATA_TARGET_DIR) kanata
	rm -rf $(KANATA_TARGET_DIR)

asystemd:
	mkdir -p $(SYSTEMD_TARGET_DIR)
	stow --restow --dir=program --target=$(SYSTEMD_TARGET_DIR) systemd

rsystemd:
	stow --delete --dir=program --target=$(SYSTEMD_TARGET_DIR) systemd
	rm -rf $(SYSTEMD_TARGET_DIR)
