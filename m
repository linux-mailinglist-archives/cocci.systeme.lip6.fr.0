Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B80503BDEC
	for <lists+cocci@lfdr.de>; Mon, 10 Jun 2019 23:01:17 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5AL0QCV002367;
	Mon, 10 Jun 2019 23:00:26 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 7742A7774;
	Mon, 10 Jun 2019 23:00:26 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 969CC76A0
 for <cocci@systeme.lip6.fr>; Mon, 10 Jun 2019 23:00:24 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x5AL0NcW010199
 for <cocci@systeme.lip6.fr>; Mon, 10 Jun 2019 23:00:23 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.63,576,1557180000"; d="scan'208";a="386756120"
Received: from abo-12-105-68.mrs.modulonet.fr (HELO hadrien) ([85.68.105.12])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Jun 2019 23:00:23 +0200
Date: Mon, 10 Jun 2019 23:00:23 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <4a6a6c17-5190-f2ad-d1ed-981e55fffe4f@web.de>
Message-ID: <alpine.DEB.2.21.1906102257030.2636@hadrien>
References: <4a6a6c17-5190-f2ad-d1ed-981e55fffe4f@web.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-464495650-1560200423=:2636"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 10 Jun 2019 23:00:29 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Mon, 10 Jun 2019 23:00:23 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] Working with pipes for parallel SmPL data processing?
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

--8323329-464495650-1560200423=:2636
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Sun, 9 Jun 2019, Markus Elfring wrote:

> Hello,
>
> The Coccinelle software supports also a variant of parallel data processing
> after the parameter “--jobs” was passed.
> https://github.com/coccinelle/coccinelle/blob/7ec31ed1fadf738bc487ccefdc63bfe0598f44cc/docs/manual/spatch_options.tex#L745
>
> It is nice when it works to distribute analysis on source files to some processors.
> Unfortunately, undesirable software behaviour can be observed if a database
> like “PostgreSQL 11.3-7.1” would be used in such a system configuration.
> Thus I imagine that it can be occasionally appropriate to perform desired
> parallel data processing by the usage of a detailed pipeline instead.
> https://ocaml.github.io/ocamlunix/pipes.html
>
> How do you think about another application for this kind of
> inter-process communication?

When you use -j, you fork processes that thus the child processes write to
a different region of memory than the parent process.

I don't have any interest in connecting Coccinelle to a database, so I'm
not going to spend any time on debugging your issue.  However, if you want
to look into it, this may be the source of the problem.

Maybe you can use a hashtable, then use merge in a finalize, and the write
the information to the database in the parent thread.

The use of merge is illustrated in eg tests/merge_vars.cocci

julia
--8323329-464495650-1560200423=:2636
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-464495650-1560200423=:2636--
