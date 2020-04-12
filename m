Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5D31A5F11
	for <lists+cocci@lfdr.de>; Sun, 12 Apr 2020 16:42:11 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03CEfsE5028107;
	Sun, 12 Apr 2020 16:41:54 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id ACB6B782F;
	Sun, 12 Apr 2020 16:41:54 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 97744775A
 for <cocci@systeme.lip6.fr>; Sun, 12 Apr 2020 16:41:52 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03CEfpiC019152
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sun, 12 Apr 2020 16:41:52 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,374,1580770800"; d="scan'208";a="345716757"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Apr 2020 16:41:51 +0200
Date: Sun, 12 Apr 2020 16:41:51 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <47a4593f-986a-b528-a537-8a94105195f1@web.de>
Message-ID: <alpine.DEB.2.21.2004121641310.2419@hadrien>
References: <146360ce-9cfb-e6f5-1601-fa95460c2cd5@web.de>
 <alpine.DEB.2.21.2004101712080.3039@hadrien>
 <f0b37f45-5144-a1c5-3f52-5bfbb6f3635f@web.de>
 <alpine.DEB.2.21.2004111600560.2369@hadrien>
 <fcbca1d9-7375-b488-54b2-a3934b90c6ed@web.de>
 <alpine.DEB.2.21.2004112036270.2369@hadrien>
 <37f5b3b3-0971-89e1-5010-9924e5b50810@web.de>
 <alpine.DEB.2.21.2004121526470.2419@hadrien>
 <924f5f7f-11a5-816e-0760-3a01cca58696@web.de>
 <alpine.DEB.2.21.2004121624180.2419@hadrien>
 <47a4593f-986a-b528-a537-8a94105195f1@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1707353127-1586702511=:2419"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 12 Apr 2020 16:41:55 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sun, 12 Apr 2020 16:41:52 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Reporting variations of condition checks according to
 function calls
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

--8323329-1707353127-1586702511=:2419
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Sun, 12 Apr 2020, Markus Elfring wrote:

> >>>> @display2@
> >>>> expression check;
> >>>> position display1.p;
> >>>> statement display1.is, display1.es;
> >>>
> >>> The problem is that you inherit es.  Since you inherit it, Coccinelle
> >>> considers that its presence is important, and so the isomorphism will not
> >>> eliminate it.
> >>
> >> Thanks for your explanation of such consequences by the metavariable inheritance.
>
> It seems that the specification of the inheritance for the metavariable “es”
> can be (temporarily) omitted as a workaround.
>
>
> >>> It is sufficient to make another pattern for the case with no else.
> >>
> >> I might stumble on another software design conflict (or the need
> >> for corresponding software extensions).
> >>
> >> I tried the specification of the SmPL rule “display2” out because I wanted
> >> to determine the source code which was matched by the SmPL nest construct
> >> in the SmPL rule “display1”.
> >> The specification of a SmPL disjunction in the first rule would trigger
> >> other known development difficulties (or open issues), wouldn't it?
> >
> > No idea.
>
> I would prefer to find the shown statement combination by a single SmPL rule.
> Can the matched source code from the construct “<+... e ...+>” be assigned
> to a metavariable like “check”?

(
  <+... e ...+>
&
  check
)

julia



>
> Regards,
> Markus
>
--8323329-1707353127-1586702511=:2419
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1707353127-1586702511=:2419--
