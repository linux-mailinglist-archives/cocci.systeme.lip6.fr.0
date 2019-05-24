Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9C02916C
	for <lists+cocci@lfdr.de>; Fri, 24 May 2019 09:02:45 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4O6pZBm029717;
	Fri, 24 May 2019 08:51:35 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 1ABD9775D;
	Fri, 24 May 2019 08:51:35 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 1D84B7747
 for <cocci@systeme.lip6.fr>; Fri, 24 May 2019 08:51:32 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x4O6pVVa021150
 for <cocci@systeme.lip6.fr>; Fri, 24 May 2019 08:51:31 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.60,506,1549926000"; d="scan'208";a="384535491"
Received: from abo-218-110-68.mrs.modulonet.fr (HELO hadrien) ([85.68.110.218])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 May 2019 08:51:10 +0200
Date: Fri, 24 May 2019 08:51:10 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <ef11ac29-3360-d2b9-c453-bb70dad0d43d@web.de>
Message-ID: <alpine.DEB.2.21.1905240849530.2689@hadrien>
References: <alpine.DEB.2.21.1905222114490.2618@hadrien>
 <81b409c6-5986-5961-5edf-843c6737d88c@web.de>
 <alpine.DEB.2.20.1905231500230.3573@hadrien>
 <3a79c8f5-9483-397a-eb98-adeb40634fe8@web.de>
 <alpine.DEB.2.20.1905231659010.3573@hadrien>
 <215d5cf7-b44c-8924-d049-e2a6e579f138@web.de>
 <alpine.DEB.2.21.1905240821260.2689@hadrien>
 <ef11ac29-3360-d2b9-c453-bb70dad0d43d@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-30015377-1558680670=:2689"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 24 May 2019 08:51:35 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Fri, 24 May 2019 08:51:31 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Checking configuration challenges around OCaml usage
	for SmPL
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

--8323329-30015377-1558680670=:2689
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Fri, 24 May 2019, Markus Elfring wrote:

> >> How will the following software situation be resolved?
> >
> > make distclean
> > ./autogen
> > ./configure
> > make
>
> These commands were executed also on my system yesterday.
>
>
> > There is no dependency on any particular system compiler version.
>
> Why is the program “ocamlc.opt” looking for the file “/usr/lib64/ocaml/list.cmi”
> instead of using the selected variant “~/.opam/4.07.1/lib/ocaml/stdlib__list.cmi”?

OK, I don't know.  Either Thierry knows or there is some problem with the
setup of your system.

julia


>
>
> > You just seem to have compiled some of your code, then upgraded your ocaml,
> > then tried to compile the rest.
>
> I find this view inappropriate when the command “opam config exec --switch 4.07.1”
> should be relevant here.
>
> Regards,
> Markus
>
--8323329-30015377-1558680670=:2689
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-30015377-1558680670=:2689--
