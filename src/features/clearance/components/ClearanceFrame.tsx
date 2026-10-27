// The prototype is static HTML and cannot read Vite env vars, so the shell hands it the
// Google Maps settings (same env var names as Ping Radar) once the iframe has loaded.
// The prototype reads them lazily when the Map pill is opened.
type MapsHost = Window & {
  clearanceMapsConfig?: { apiKey: string; mapId?: string }
}

function shareMapsConfig(frame: HTMLIFrameElement) {
  const host = frame.contentWindow as MapsHost | null
  const apiKey = import.meta.env.VITE_GOOGLE_MAPS_API_KEY
  if (!host || !apiKey) return
  host.clearanceMapsConfig = { apiKey, mapId: import.meta.env.VITE_GOOGLE_MAPS_LIGHT_MAP_ID }
}

export function ClearanceFrame() {
  return (
    <div style={{ minHeight: '100vh', background: '#f6f8fc' }}>
      <iframe
        src="/clearance-prototype.html"
        title="Clearance Prototype"
        onLoad={(event) => shareMapsConfig(event.currentTarget)}
        style={{
          display: 'block',
          width: '100%',
          height: '100vh',
          border: 0,
          background: '#f6f8fc',
        }}
      />
    </div>
  )
}
