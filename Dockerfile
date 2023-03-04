#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "apply-templates.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

FROM ruby:3.1.3-buster
RUN apt-get update; \
	apt-get install -y --no-install-recommends \
	fluid-soundfont-gm\
	fluidsynth; \
	rm -rf /var/lib/apt/lists/*;

RUN mkdir /usr/share/soundfonts/;\
	ln -s /usr/share/sounds/sf2/FluidR3_GM.sf2 /usr/share/soundfonts/default.sf2

RUN cd ~; \
	git clone https://github.com/taishi-sama/midi-website; \
	cd ~/midi-website; \
	bundler; \
	rails db:migrate

#WORKDIR "/root/midi-website"
#RUN "rails" "db" "migrate"

EXPOSE 3000
WORKDIR "/root/midi-website"
CMD "rails" "s" "--binding=0.0.0.0"