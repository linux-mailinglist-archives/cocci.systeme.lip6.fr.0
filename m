Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3241F16B9
	for <lists+cocci@lfdr.de>; Mon,  8 Jun 2020 12:31:32 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 058AVCp0008405;
	Mon, 8 Jun 2020 12:31:12 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 4294C7827;
	Mon,  8 Jun 2020 12:31:12 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id AFE7B44A7
 for <cocci@systeme.lip6.fr>; Mon,  8 Jun 2020 12:31:10 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 058AV98U000126
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Mon, 8 Jun 2020 12:31:10 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,487,1583190000"; d="scan'208";a="350899400"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jun 2020 12:31:09 +0200
Date: Mon, 8 Jun 2020 12:31:09 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <0a07fbfd-df53-2386-dd02-4d179d963e81@web.de>
Message-ID: <alpine.DEB.2.21.2006081228380.3136@hadrien>
References: <0a07fbfd-df53-2386-dd02-4d179d963e81@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1478620266-1591612269=:3136"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 08 Jun 2020 12:31:12 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 08 Jun 2020 12:31:10 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr, Denis Efremov <efremov@ispras.ru>
Subject: Re: [Cocci] Python interface
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

--8323329-1478620266-1591612269=:3136
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Mon, 8 Jun 2020, Markus Elfring wrote:

> > > > @r depends on !patch@
> > > // It doesn't work. Is it normal?
> > > //position p: script:python() { matches.extend(p); relevant(p) };
> >
> > "Doesn't work" means you get a parse error?  The parser of the code inside
> > the {} is pretty fragile.
>
> I find such information also interesting.
>
>
> > Perhaps this could be improved somewhat, but it is limited by the fact
> > that Coccinelle doesn't know how to parse python properly.
>
> Should the software be able to determine just the amount of script code
> between the curly brackets?

What if there is a string or comment inside the script code, ant it
contains only a }?

Anyway the problem is that the Coccinelle lexer doesn't know that it is
looking at script code, or eg {} around a selection of types.

> > which is not run in parallel.
>
> Will a SmPL child process get a chance to perform customised finalisation code?
> Would you like to continue the clarification according to a topic
> like “Complete support for fork-join work flows”?
> https://github.com/coccinelle/coccinelle/issues/50

Those issues are addressed by the use of the merge functionality.

julia
--8323329-1478620266-1591612269=:3136
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1478620266-1591612269=:3136--
