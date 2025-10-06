import { useState } from 'react';
import { Sparkles, Zap, Eye, Layers, ChevronRight, Play, Shield, Gauge } from 'lucide-react';

function App() {
  const [activeFeature, setActiveFeature] = useState(0);

  const features = [
    {
      icon: Eye,
      title: 'Object Recognition',
      description: 'Real-time AI-powered object detection and tracking in augmented space',
      color: 'from-cyan-500 to-blue-600'
    },
    {
      icon: Layers,
      title: 'Spatial Mapping',
      description: 'Advanced 3D environment mapping and surface detection',
      color: 'from-blue-500 to-violet-600'
    },
    {
      icon: Sparkles,
      title: 'AI Enhancement',
      description: 'Machine learning models for enhanced AR experiences',
      color: 'from-violet-500 to-fuchsia-600'
    },
    {
      icon: Zap,
      title: 'Real-time Processing',
      description: 'Ultra-low latency AR rendering and interaction',
      color: 'from-fuchsia-500 to-pink-600'
    }
  ];

  const stats = [
    { label: 'Processing Speed', value: '60 FPS', icon: Gauge },
    { label: 'Accuracy Rate', value: '99.2%', icon: Shield },
    { label: 'Active Users', value: '50K+', icon: Eye }
  ];

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-950 via-slate-900 to-slate-950 text-white">
      <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_top_right,_var(--tw-gradient-stops))] from-cyan-900/20 via-transparent to-transparent"></div>
      <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_bottom_left,_var(--tw-gradient-stops))] from-violet-900/20 via-transparent to-transparent"></div>

      <div className="relative">
        <nav className="border-b border-white/10 backdrop-blur-xl bg-slate-900/50">
          <div className="max-w-7xl mx-auto px-6 py-4 flex items-center justify-between">
            <div className="flex items-center gap-3">
              <div className="w-10 h-10 rounded-xl bg-gradient-to-br from-cyan-500 to-violet-600 flex items-center justify-center">
                <Layers className="w-6 h-6" />
              </div>
              <div>
                <h1 className="text-xl font-bold bg-gradient-to-r from-cyan-400 to-violet-400 bg-clip-text text-transparent">AR Vision AI</h1>
                <p className="text-xs text-slate-400">Augmented Reality Platform</p>
              </div>
            </div>
            <div className="flex items-center gap-4">
              <button className="px-4 py-2 text-sm text-slate-300 hover:text-white transition-colors">Documentation</button>
              <button className="px-4 py-2 text-sm text-slate-300 hover:text-white transition-colors">Pricing</button>
              <button className="px-5 py-2.5 rounded-lg bg-gradient-to-r from-cyan-500 to-violet-600 hover:from-cyan-400 hover:to-violet-500 text-white text-sm font-semibold transition-all shadow-lg shadow-cyan-500/25 hover:shadow-cyan-500/40">
                Get Started
              </button>
            </div>
          </div>
        </nav>

        <main>
          <section className="max-w-7xl mx-auto px-6 pt-20 pb-16">
            <div className="grid lg:grid-cols-2 gap-12 items-center">
              <div>
                <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-cyan-500/10 border border-cyan-500/20 mb-6">
                  <Sparkles className="w-4 h-4 text-cyan-400" />
                  <span className="text-sm text-cyan-300">Next-Gen AR Technology</span>
                </div>
                <h2 className="text-6xl font-bold mb-6 leading-tight">
                  Transform Reality with
                  <span className="block bg-gradient-to-r from-cyan-400 via-blue-400 to-violet-400 bg-clip-text text-transparent">
                    AI-Powered AR
                  </span>
                </h2>
                <p className="text-xl text-slate-400 mb-8 leading-relaxed">
                  Experience the future of augmented reality with advanced machine learning,
                  real-time object recognition, and seamless spatial computing.
                </p>
                <div className="flex items-center gap-4">
                  <button className="group px-8 py-4 rounded-xl bg-gradient-to-r from-cyan-500 to-violet-600 hover:from-cyan-400 hover:to-violet-500 text-white font-semibold transition-all shadow-2xl shadow-cyan-500/30 hover:shadow-cyan-500/50 flex items-center gap-2">
                    <Play className="w-5 h-5" />
                    Launch Demo
                    <ChevronRight className="w-5 h-5 group-hover:translate-x-1 transition-transform" />
                  </button>
                  <button className="px-8 py-4 rounded-xl bg-white/5 hover:bg-white/10 border border-white/10 text-white font-semibold transition-all">
                    View Examples
                  </button>
                </div>

                <div className="grid grid-cols-3 gap-6 mt-12 pt-8 border-t border-white/10">
                  {stats.map((stat, i) => (
                    <div key={i} className="text-center">
                      <div className="flex justify-center mb-2">
                        <stat.icon className="w-5 h-5 text-cyan-400" />
                      </div>
                      <div className="text-2xl font-bold text-white mb-1">{stat.value}</div>
                      <div className="text-xs text-slate-400">{stat.label}</div>
                    </div>
                  ))}
                </div>
              </div>

              <div className="relative">
                <div className="absolute inset-0 bg-gradient-to-r from-cyan-500 to-violet-600 rounded-3xl blur-3xl opacity-20"></div>
                <div className="relative bg-slate-900/50 backdrop-blur-xl border border-white/10 rounded-3xl p-8 shadow-2xl">
                  <img
                    src="https://images.pexels.com/photos/8566472/pexels-photo-8566472.jpeg?auto=compress&cs=tinysrgb&w=800"
                    alt="AR Experience"
                    className="w-full h-80 object-cover rounded-2xl mb-6 shadow-lg"
                  />
                  <div className="space-y-4">
                    {features.map((feature, i) => {
                      const Icon = feature.icon;
                      return (
                        <button
                          key={i}
                          onClick={() => setActiveFeature(i)}
                          className={`w-full text-left p-4 rounded-xl transition-all ${
                            activeFeature === i
                              ? 'bg-gradient-to-r ' + feature.color + ' shadow-lg'
                              : 'bg-white/5 hover:bg-white/10'
                          }`}
                        >
                          <div className="flex items-center gap-3">
                            <div className={`w-10 h-10 rounded-lg flex items-center justify-center ${
                              activeFeature === i ? 'bg-white/20' : 'bg-white/10'
                            }`}>
                              <Icon className="w-5 h-5" />
                            </div>
                            <div className="flex-1">
                              <h3 className="font-semibold text-sm mb-1">{feature.title}</h3>
                              <p className={`text-xs ${
                                activeFeature === i ? 'text-white/90' : 'text-slate-400'
                              }`}>{feature.description}</p>
                            </div>
                          </div>
                        </button>
                      );
                    })}
                  </div>
                </div>
              </div>
            </div>
          </section>

          <section className="max-w-7xl mx-auto px-6 py-16">
            <div className="text-center mb-12">
              <h3 className="text-4xl font-bold mb-4">Powered by Advanced Technology</h3>
              <p className="text-xl text-slate-400">Industry-leading AR and AI capabilities</p>
            </div>
            <div className="grid md:grid-cols-3 gap-6">
              <div className="group relative bg-slate-900/50 backdrop-blur-xl border border-white/10 rounded-2xl p-8 hover:border-cyan-500/50 transition-all">
                <div className="absolute inset-0 bg-gradient-to-br from-cyan-500/10 to-transparent rounded-2xl opacity-0 group-hover:opacity-100 transition-opacity"></div>
                <img
                  src="https://images.pexels.com/photos/2599244/pexels-photo-2599244.jpeg?auto=compress&cs=tinysrgb&w=400"
                  alt="Computer Vision"
                  className="w-full h-48 object-cover rounded-xl mb-6"
                />
                <h4 className="text-xl font-bold mb-3">Computer Vision</h4>
                <p className="text-slate-400">Advanced neural networks for precise object detection and scene understanding</p>
              </div>
              <div className="group relative bg-slate-900/50 backdrop-blur-xl border border-white/10 rounded-2xl p-8 hover:border-violet-500/50 transition-all">
                <div className="absolute inset-0 bg-gradient-to-br from-violet-500/10 to-transparent rounded-2xl opacity-0 group-hover:opacity-100 transition-opacity"></div>
                <img
                  src="https://images.pexels.com/photos/8728382/pexels-photo-8728382.jpeg?auto=compress&cs=tinysrgb&w=400"
                  alt="Spatial Computing"
                  className="w-full h-48 object-cover rounded-xl mb-6"
                />
                <h4 className="text-xl font-bold mb-3">Spatial Computing</h4>
                <p className="text-slate-400">Real-time 3D mapping and environmental analysis for immersive experiences</p>
              </div>
              <div className="group relative bg-slate-900/50 backdrop-blur-xl border border-white/10 rounded-2xl p-8 hover:border-pink-500/50 transition-all">
                <div className="absolute inset-0 bg-gradient-to-br from-pink-500/10 to-transparent rounded-2xl opacity-0 group-hover:opacity-100 transition-opacity"></div>
                <img
                  src="https://images.pexels.com/photos/8386440/pexels-photo-8386440.jpeg?auto=compress&cs=tinysrgb&w=400"
                  alt="Machine Learning"
                  className="w-full h-48 object-cover rounded-xl mb-6"
                />
                <h4 className="text-xl font-bold mb-3">Machine Learning</h4>
                <p className="text-slate-400">Continuous learning algorithms that adapt to user behavior and preferences</p>
              </div>
            </div>
          </section>
        </main>

        <footer className="border-t border-white/10 backdrop-blur-xl bg-slate-900/50 mt-20">
          <div className="max-w-7xl mx-auto px-6 py-8">
            <div className="flex items-center justify-between">
              <div className="flex items-center gap-3">
                <div className="w-8 h-8 rounded-lg bg-gradient-to-br from-cyan-500 to-violet-600 flex items-center justify-center">
                  <Layers className="w-5 h-5" />
                </div>
                <span className="font-semibold">AR Vision AI</span>
              </div>
              <p className="text-sm text-slate-400">© 2025 AR Vision AI. All rights reserved.</p>
            </div>
          </div>
        </footer>
      </div>
    </div>
  );
}

export default App;
