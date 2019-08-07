Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD388555C
	for <lists+cocci@lfdr.de>; Wed,  7 Aug 2019 23:40:45 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x77LeDD3019926;
	Wed, 7 Aug 2019 23:40:13 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 441D07795;
	Wed,  7 Aug 2019 23:40:13 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 4EE7576B2
 for <cocci@systeme.lip6.fr>; Wed,  7 Aug 2019 23:40:11 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x77LeA0k018499
 for <cocci@systeme.lip6.fr>; Wed, 7 Aug 2019 23:40:11 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,358,1559512800"; d="scan'208";a="315874224"
Received: from abo-12-105-68.mrs.modulonet.fr (HELO hadrien) ([85.68.105.12])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Aug 2019 23:40:05 +0200
Date: Wed, 7 Aug 2019 23:40:04 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: =?ISO-8859-15?Q?Christoph_B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <656aeb1b-9c94-a428-bb0e-4397a0432651@linbit.com>
Message-ID: <alpine.DEB.2.21.1908072337230.2601@hadrien>
References: <b4c91fb8-5606-c06e-e349-5415458cf3b5@linbit.com>
 <alpine.DEB.2.21.1908030841460.2547@hadrien>
 <656aeb1b-9c94-a428-bb0e-4397a0432651@linbit.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 07 Aug 2019 23:40:18 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Wed, 07 Aug 2019 23:40:11 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Make rule depend on comment
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

If you pull Coccinelle from github, you will be able to write the
following.  The code on line 2 probably has to be an ocaml script at the
moment, because I didn't do anything to support python.  You can use the
code that is shown in the example directly.  It checks that the list of
comments between the ) and the { is not empty.  The second scriptcan use
ocaml or python as you like.

@ find_kmap_tagged_function @
comments tag : script:ocaml () { let (c1b,c1m,c1a) = List.hd tag in not
(c1a = []) };
identifier fn;
@@
fn(...)@tag {
...
}

@ script:ocaml parse_kmap_tag @
fn << find_kmap_tagged_function.fn;
@@
Printf.printf "have comment in %s\n" fn

--------

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
