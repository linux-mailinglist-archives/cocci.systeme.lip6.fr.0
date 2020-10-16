Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2A229028B
	for <lists+cocci@lfdr.de>; Fri, 16 Oct 2020 12:07:59 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 09GA7grM002019;
	Fri, 16 Oct 2020 12:07:42 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id D0C4077BC;
	Fri, 16 Oct 2020 12:07:42 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 2D661578C
 for <cocci@systeme.lip6.fr>; Fri, 16 Oct 2020 12:07:41 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 09GA7e6w012060
 for <cocci@systeme.lip6.fr>; Fri, 16 Oct 2020 12:07:40 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,382,1596492000"; d="scan'208";a="361979506"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Oct 2020 12:07:40 +0200
Date: Fri, 16 Oct 2020 12:07:40 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <3528117.7ODa3CK5J5@sonne>
Message-ID: <alpine.DEB.2.22.394.2010161202360.41305@hadrien>
References: <3528117.7ODa3CK5J5@sonne>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-25622-1602842860=:41305"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 16 Oct 2020 12:07:43 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 16 Oct 2020 12:07:40 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] [PATCH v8] coccinelle: api: add kfree_mismatch script
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

--8323329-25622-1602842860=:41305
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Fri, 16 Oct 2020, Markus Elfring wrote:

> …
> > +    E = \(kmalloc\|kzalloc\|krealloc\|kcalloc\|
> > +          kmalloc_node\|kzalloc_node\|kmalloc_array\|
> > +          kmalloc_array_node\|kcalloc_node\)(...)@kok
> …
>
> How do you think about the possibility for any adjustments according to the order
> of the mentioned function names in proposed disjunctions for the semantic patch language?

Please think about this for 5 seconds.  Maybe there are 2000 calls to
these allocation functions, and maybe there are a million function calls
in the files that contain these calls.  Microscopically optimizing the
treatment of 2000 calls is not going to do anything to help the overall
runtime, which depends on matching all of the above function names against
the one million overall calls.

> Can any additional identifiers become relevant?

If you have other names to suggest, please do.  If you don't have other
names to suggest, then please stop asking such rhetorical questions.

julia
--8323329-25622-1602842860=:41305
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-25622-1602842860=:41305--
