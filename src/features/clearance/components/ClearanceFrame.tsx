export function ClearanceFrame() {
  return (
    <div style={{ minHeight: '100vh', background: '#f6f8fc' }}>
      <iframe
        src="/clearance-prototype.html"
        title="Clearance Prototype"
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
