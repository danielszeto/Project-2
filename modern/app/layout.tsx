import type { Metadata } from 'next';
import Link from 'next/link';
import './globals.css';
export const metadata: Metadata = {title:'BakR | Made with love, baked near you',description:'Discover small-batch breads, cakes, cookies and pastries from local home bakers.'};
export default function RootLayout({children}:{children:React.ReactNode}) {
return <html lang="en"><body><div className="announcement">Small batches. Big love. Made by bakers near you.</div><header className="site-header"><div className="shell header-inner"><Link className="brand" href="/" aria-label="BakR home"><span className="brand-mark">✳</span> bakr<span className="brand-dot">.</span></Link><nav aria-label="Main navigation"><Link href="/#discover">Explore bakes</Link><Link href="/#how-it-works">How it works</Link></nav><div className="header-actions"><Link className="text-link" href="/account">My account</Link><Link className="button button-dark small" href="/sell">Start baking <span aria-hidden="true">↗</span></Link></div></div></header>{children}<footer className="footer"><div className="shell footer-inner"><Link className="brand" href="/">bakr<span className="brand-dot">.</span></Link><p>Good things take butter and time. © {new Date().getFullYear()} BakR</p><p>Made for the neighborhood.</p></div></footer></body></html>;
}
