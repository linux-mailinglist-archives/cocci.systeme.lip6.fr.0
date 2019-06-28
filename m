Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C48E159900
	for <lists+cocci@lfdr.de>; Fri, 28 Jun 2019 13:08:38 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5SB7tfv010673;
	Fri, 28 Jun 2019 13:07:55 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 056667786;
	Fri, 28 Jun 2019 13:07:55 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id F0D7A777B
 for <cocci@systeme.lip6.fr>; Fri, 28 Jun 2019 13:07:52 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5SB7p9Q002548
 for <cocci@systeme.lip6.fr>; Fri, 28 Jun 2019 13:07:52 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,427,1557180000"; d="scan'208";a="311767956"
Received: from wifi-eduroam-85-160.paris.inria.fr ([128.93.85.160])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jun 2019 13:07:51 +0200
Date: Fri, 28 Jun 2019 13:07:51 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <904b9362-cd01-ffc9-600b-0c48848617a0@web.de>
Message-ID: <alpine.DEB.2.21.1906281304470.2538@hadrien>
References: <1561690732-20694-1-git-send-email-wen.yang99@zte.com.cn>
 <904b9362-cd01-ffc9-600b-0c48848617a0@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-202224278-1561720071=:2538"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 28 Jun 2019 13:07:57 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Fri, 28 Jun 2019 13:07:52 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Yi Wang <wang.yi59@zte.com.cn>, Michal Marek <michal.lkml@markovi.net>,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
        cocci@systeme.lip6.fr, Wen Yang <wen.yang99@zte.com.cn>
Subject: Re: [Cocci] [PATCH v2] coccinelle: semantic code search for missing
 of_node_put
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

--8323329-202224278-1561720071=:2538
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

> > +x = @p1\(of_find_all_nodes\|
>
> I would find this SmPL disjunction easier to read without the usage
> of extra backslashes.
>
> +x =
> +(of_…
> +|of_…
> +)@p1(...);

Did you actually test this?  I doubt that a position metavariable can be
put on a ) of a disjunction.

> > +|
> > +return x;
> > +|
> > +return of_fwnode_handle(x);
>
> Can a nested SmPL disjunction be helpful at such places?
>
> +|return
> +(x
> +|of_fwnode_handle(x)
> +);

The original code is much more readable.  The internal representation will
be the same.

> > +    when != v4l2_async_notifier_add_fwnode_subdev(<...x...>)
>
> Would the specification variant “<+... x ...+>” be relevant
> for the parameter selection?

I'm indeed quite surprised that <...x...> would be accepted by the parser.

julia
--8323329-202224278-1561720071=:2538
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-202224278-1561720071=:2538--
