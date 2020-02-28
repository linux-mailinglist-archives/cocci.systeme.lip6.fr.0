Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DE2173771
	for <lists+cocci@lfdr.de>; Fri, 28 Feb 2020 13:45:52 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 01SCjQho008128;
	Fri, 28 Feb 2020 13:45:26 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 989997812;
	Fri, 28 Feb 2020 13:45:26 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 1FD167800
 for <cocci@systeme.lip6.fr>; Fri, 28 Feb 2020 13:45:25 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 01SCjOeN008194
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 28 Feb 2020 13:45:24 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,496,1574118000"; d="scan'208";a="340719300"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Feb 2020 13:45:24 +0100
Date: Fri, 28 Feb 2020 13:45:23 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Emmanuel Arias <eamanu@yaerobi.com>
In-Reply-To: <CAFNO5of+YgGHTkdidk-fu8U95zEtmPhPPZdNW30Q12Df1j2cbw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2002281344590.4267@hadrien>
References: <786d2ea9-621f-bcc4-b626-aed6454784e2@yaerobi.com>
 <alpine.DEB.2.21.2002041556540.3345@hadrien>
 <909d202d-9a8a-d010-107b-80c07febcb0f@yaerobi.com>
 <65ec26be-3b40-4248-4fc6-e30f6785f9b1@univ-grenoble-alpes.fr>
 <alpine.DEB.2.21.2002271044550.4309@hadrien>
 <1183e7d0-b6e4-834d-5b27-47c43661bae6@univ-grenoble-alpes.fr>
 <alpine.DEB.2.21.2002271102350.2973@hadrien>
 <CAFNO5of+YgGHTkdidk-fu8U95zEtmPhPPZdNW30Q12Df1j2cbw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-271308884-1582893924=:4267"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 28 Feb 2020 13:45:27 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 28 Feb 2020 13:45:24 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] coccinelle depends on unmaintained pygtk
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-271308884-1582893924=:4267
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Fri, 28 Feb 2020, Emmanuel Arias wrote:

> Hi Nicolas,
>
> It seems that PyGTKCompat is not in Debian, so IMHO I would not consider
> that option.
>
> The files with pygtk are:
>
> docs/manual/cocci-python.txt:The latter depends on pygtk2, and the
> dependency will not be evaluated until runtime.
> python/coccilib/coccigui/coccigui.py:import pygtk
> python/coccilib/coccigui/coccigui.py:pygtk.require("2.0")
> python/coccilib/coccigui/pycoccimodel.py:import pygtk
>
> So according with Julia, removing that files will not affect to coccinelle.

The files are gone in github.  We expect to make a new release within
about a week.

julia

>
>
>
> On Thu, Feb 27, 2020 at 7:04 AM Julia Lawall <julia.lawall@inria.fr> wrote:
>
>
>       On Thu, 27 Feb 2020, Nicolas Palix wrote:
>
>       > Le 27/02/2020 à 10:45, Julia Lawall a écrit :
>       > >
>       > >
>       > > On Thu, 27 Feb 2020, Nicolas Palix wrote:
>       > >
>       > > > Hi Emmanuel,
>       > > >
>       > > > Instead of porting to GObject directly,
>       > > > can we use PyGTKCompat ?
>       > > >
>       > > > https://wiki.gnome.org/Projects/PyGObject/PyGTKCompat
>       > >
>       > > The problem is resolved by removing the python file that
>       relied on the
>       > > unavailable library.  I don't think that that python file is
>       useful.
>       >
>       > It looks like python/coccilib/coccigui contains the offending
>       files:
>       > coccigui.py, pygui.glade and pygui.gradep.
>       > But according to vimcom.py and vimembed.py, these laters also
>       depend of GTK.
>       >
>       > Should the coccigui folder be entirely removed ?
>
>       Yes, they have already been removed on github.
>
>       julia
>
>
>       >
>       > >
>       > > julia
>       > >
>       > > >
>       > > > Regards,
>       > > >
>       > > > Le 04/02/2020 à 16:25, eamanu a écrit :
>       > > > > Hi!
>       > > > >
>       > > > > On 04/02/2020 11:59, Julia Lawall wrote:
>       > > > > > On Tue, 4 Feb 2020, eamanu wrote:
>       > > > > >
>       > > > > > > Hi everybody,
>       > > > > > >
>       > > > > > > Sorry if this issues is duplicated, I am new in the
>       mailing list
>       > > > > > > and in a very quickly searching I didn't found about
>       this issue.
>       > > > > > >
>       > > > > > > I am working on Coccinelle package on Debian
>       > > > > > Thanks!
>       > > > > >
>       > > > > > > and currently
>       > > > > > > exist the next bug [1].
>       > > > > > >
>       > > > > > > There is any plan to port to use GObject
>       Instrospection?
>       > > > > > >
>       > > > > > > [1]
>       https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=885267
>       > > > > > I think we should just drop the code that depends on
>       it.  It was added
>       > > > > > for
>       > > > > > a MS thesis more than 10 years ago, and I don't think
>       anyone has used
>       > > > > > it
>       > > > > > since.
>       > > > > >
>       > > > > > I will look into it.
>       > > > >
>       > > > > Great, if you need help, I can help :-)
>       > > > >
>       > > > > I will wait for any news. Thanks
>       > > > >
>       > > > > eamanu
>       > > > > >
>       > > > > > julia
>       > > > >
>       > > > > _______________________________________________
>       > > > > Cocci mailing list
>       > > > > Cocci@systeme.lip6.fr
>       > > > > https://systeme.lip6.fr/mailman/listinfo/cocci
>       > > > >
>       > > >
>       > > >
>       > > > --
>       > > > Nicolas Palix
>       > > > http://lig-membres.imag.fr/palix/
>       > > >
>       > >
>       >
>       >
>       > --
>       > Nicolas Palix
>       > http://lig-membres.imag.fr/palix/
>       >
>
>
>
--8323329-271308884-1582893924=:4267
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-271308884-1582893924=:4267--
