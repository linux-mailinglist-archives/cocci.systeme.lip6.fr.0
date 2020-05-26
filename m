Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 791211B3F8D
	for <lists+cocci@lfdr.de>; Wed, 22 Apr 2020 12:39:12 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 03MAckd2003197;
	Wed, 22 Apr 2020 12:38:46 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id ABEAF7825;
	Wed, 22 Apr 2020 12:38:46 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 611603DC8
 for <cocci@systeme.lip6.fr>; Wed, 22 Apr 2020 12:38:44 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 03MAchZD002294
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 22 Apr 2020 12:38:43 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,414,1580770800"; d="scan'208";a="446341532"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 12:38:24 +0200
Date: Wed, 22 Apr 2020 12:38:24 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <67211452-a192-ba7e-054f-f7faf9656c15@web.de>
Message-ID: <alpine.DEB.2.21.2004221237340.2425@hadrien>
References: <67211452-a192-ba7e-054f-f7faf9656c15@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1911070504-1587551904=:2425"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 22 Apr 2020 12:38:48 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 22 Apr 2020 12:38:44 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Combining isomorphisms with source code adjustments?
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

--8323329-1911070504-1587551904=:2425
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Wed, 22 Apr 2020, Markus Elfring wrote:

> Hello,
>
> I have taken another look at the following information.
> https://github.com/coccinelle/coccinelle/blob/6b4bb692f208bfe86e62a616724570d9310c7150/standard.iso#L544
>
> …
> // Affectation/initialisation isomorphism
> …
> // They are handled in engine.
> // 'X = Y'  should also match  'type X = Y';
> …
>
>
> I have tried another script out for the semantic patch language.
>
> @deletion@
> expression input, storage, target;
> @@
>  storage
> -        = input
>  ... when != storage
>  target = ...
>
>
> elfring@Sonne:~/Projekte/Coccinelle/janitor> spatch --parse-cocci delete_unused_value4.cocci
> …
> the simple assignment expression on line 4 contains transformations
> that prevent it from matching a declaration (not pure)
> …
>
>
> How do you think about the software situation?

I think what the message says.  You have put a - in an awkward place so it
may not be able to apply some isomorphisms.

julia
--8323329-1911070504-1587551904=:2425
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1911070504-1587551904=:2425--
