require 'rails_helper'

RSpec.describe MarkdownService do
  describe 'simple markdown string' do
    let(:markdown) { '### Some markdown' }
    it { expect(MarkdownService.new(markdown: markdown).call).to eq(["<h3 id=\"some-markdown\">Some markdown</h3>\n",nil]) }
  end

  describe '#mentions_to_links' do
    let(:markdown) { '#ignore'}
    let(:rendered_html) { "<h3 id=\"some-markdownn-sean-some-text\">Some markdown\\n @Sean some text</h3>\n" }
    let(:mentions_cache) { JSON.parse("[{\"id\":1,\"name\":\"Sean\"},{\"id\":22,\"name\":\"Hanno\"}]") }
    it { expect(MarkdownService.new(markdown: markdown).mentions_to_links(rendered_html: rendered_html, mentions_cache: mentions_cache))
           .to eq(["<h3 id=\"some-markdownn-sean-some-text\">Some markdown\\n <a href='/participants/1' target='_blank'>@Sean</a> some text</h3>\n", [1]]) }
  end

  describe 'single mentions' do
    let(:markdown) { '### Some markdown\n @Sean some text' }
    let(:mentions_cache) { "[{\"id\":1,\"name\":\"Sean\"}]" }
    it { expect(MarkdownService.new(markdown: markdown, mentions_cache: mentions_cache).call)
           .to eq(["<h3 id=\"some-markdownn-sean-some-text\">Some markdown\\n <a href='/participants/1' target='_blank'>@Sean</a> some text</h3>\n", [1]]) }
  end

  describe 'multiple mentions' do
    let(:markdown) { '### Some markdown\n @Sean some text @Hanno' }
    let(:mentions_cache) { "[{\"id\":1,\"name\":\"Sean\"},{\"id\":22,\"name\":\"Hanno\"}]" }
    it { expect(MarkdownService.new(markdown: markdown, mentions_cache: mentions_cache).call)
           .to eq(["<h3 id=\"some-markdownn-sean-some-text-hanno\">Some markdown\\n <a href='/participants/1' target='_blank'>@Sean</a> some text <a href='/participants/22' target='_blank'>@Hanno</a></h3>\n", [1, 22]]) }
  end

  describe 'mention in cache but removed from markdown' do
    let(:markdown) { '### Some markdown\n @Sean some text' }
    let(:mentions_cache) { "[{\"id\":1,\"name\":\"Sean\"},{\"id\":22,\"name\":\"Hanno\"}]" }
    it { expect(MarkdownService.new(markdown: markdown, mentions_cache: mentions_cache).call)
           .to eq(["<h3 id=\"some-markdownn-sean-some-text\">Some markdown\\n <a href='/participants/1' target='_blank'>@Sean</a> some text</h3>\n", [1]]) }
  end

  describe 'markdown is nil' do
    let(:markdown) { nil }
    it { expect(MarkdownService.new(markdown: markdown).call).to eq([nil,nil]) }
  end
end
