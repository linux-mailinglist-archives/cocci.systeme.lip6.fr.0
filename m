Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B142C1C56B4
	for <lists+cocci@lfdr.de>; Tue,  5 May 2020 15:23:58 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 045DNW8G022877;
	Tue, 5 May 2020 15:23:32 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id D0703782D;
	Tue,  5 May 2020 15:23:32 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 3C1003E6B
 for <cocci@systeme.lip6.fr>; Tue,  5 May 2020 15:23:31 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 045DNUAZ018301
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 5 May 2020 15:23:30 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,355,1583190000"; d="scan'208";a="448283828"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 May 2020 15:23:30 +0200
Date: Tue, 5 May 2020 15:23:30 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Nicolas Palix <nicolas.palix@univ-grenoble-alpes.fr>
In-Reply-To: <fe7da089-446f-1d37-3d37-b24cdeff2a9f@univ-grenoble-alpes.fr>
Message-ID: <alpine.DEB.2.21.2005051522410.2462@hadrien>
References: <alpine.DEB.2.21.1909302142430.2925@hadrien>
 <eccc921f-c5f5-6dc5-5233-75f0fc16cb51@schleiser.de>
 <904fcac6-77cb-b44b-07fd-430bf3596614@univ-grenoble-alpes.fr>
 <ed125ed8-a2f8-2c1a-b0aa-acf83544cae8@schleiser.de>
 <fe7da089-446f-1d37-3d37-b24cdeff2a9f@univ-grenoble-alpes.fr>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1684570778-1588685010=:2462"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 05 May 2020 15:23:33 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 05 May 2020 15:23:30 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] 1.0.8 on Ubuntu
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

--8323329-1684570778-1588685010=:2462
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Tue, 5 May 2020, Nicolas Palix wrote:

>
>
> Le 05/05/2020 à 11:16, Kaspar Schleiser a écrit :
> > Hi Nicolas,
> >
> > thanks for the quick reply!
>
> You're welcome.
>
> Julia, maybe it worth recording the sequence of commands somewhere,
> in the README or the website.

Good idea.  I'm just concerned about the word "roughly".  Kaspar are there
any details that need to be added?

thanks,
julia

>
> >
> > On 5/5/20 10:50 AM, Nicolas Palix wrote:
> >> I think you could try the following version (intended for 20.10).
> >> https://launchpad.net/ubuntu/+source/coccinelle/1.0.8.deb-2
> >
> > I managed to compile the 19.04 version
> > (coccinelle_1.0.8~19.04npalix1.dsc,
> > coccinelle_1.0.8~19.04npalix1.tar.xz). Somehow I missed that there's a
> > 20.10 version.
> >
> > The commands were roughly:
> >
> > $ apt install debhelper devscripts equivs
> > $ dpkg-source -x coccinelle_1.0.8~19.04npalix1.dsc
> > $ cd coccinelle-1.0.8
> > $ mk-build-deps -i
> > $ dpkg-buildpackage -rfakeroot -b
> > $ apt install ../coccinelle_1.0.8~19.04npalix1_amd64.deb
> >
> > The resulting .deb can be installed on an otherwise clean focal:latest
> > container. The spatch binary starts (prints help), did not do further
> > testing.
> >
> > Kaspar
> >
>
>
> --
> Nicolas Palix
> http://lig-membres.imag.fr/palix/
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
--8323329-1684570778-1588685010=:2462
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1684570778-1588685010=:2462--
