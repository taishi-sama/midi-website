class MidiConvertFluidsynthJob < ApplicationJob
  queue_as :default

  def perform(*args)
    args.each do |mid|
      mid.midi.open do |file|
        tmp = Rails.root + 'tmp'
        ogg = mid.id.to_s + '.ogg';
        puts file.path + '------------------------------';
         
        system 'fluidsynth', '-nli', '-r 48000', '-o', 'synth.cpu-cores=1', '-T', 'oga', '-F', (tmp + ogg).to_s, file.path
        mid.fluidsynth.attach(io: File.open(tmp + ogg), filename: ogg)
        File.delete(tmp + ogg)
      end
    end
  end
end
