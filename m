Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8054F1F8ADD
	for <lists+cocci@lfdr.de>; Sun, 14 Jun 2020 23:18:18 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05ELHtWq003675;
	Sun, 14 Jun 2020 23:17:55 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id C6C947814;
	Sun, 14 Jun 2020 23:17:55 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from osiris.lip6.fr (osiris.lip6.fr [132.227.60.30])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id A1E0A44A7
 for <cocci@systeme.lip6.fr>; Sun, 14 Jun 2020 23:17:53 +0200 (CEST)
Received: from smtprelay.hostedemail.com (smtprelay0221.hostedemail.com
 [216.40.44.221])
 by osiris.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05ELHnDL008380
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <cocci@systeme.lip6.fr>; Sun, 14 Jun 2020 23:17:50 +0200 (CEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave01.hostedemail.com (Postfix) with ESMTP id A085A1813B78C
 for <cocci@systeme.lip6.fr>; Sun, 14 Jun 2020 20:01:58 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id ABA7C15C6;
 Sun, 14 Jun 2020 20:01:54 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:965:966:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2194:2196:2199:2200:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3866:3867:3870:3871:3872:4321:4385:4390:4395:4605:5007:7903:8568:10004:10400:10848:11026:11232:11658:11914:12043:12296:12297:12438:12740:12760:12895:13069:13311:13357:13439:14659:14721:21080:21627:30054:30070:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:2, LUA_SUMMARY:none
X-HE-Tag: light02_2e08cc026df0
X-Filterd-Recvd-Size: 1857
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Sun, 14 Jun 2020 20:01:53 +0000 (UTC)
Message-ID: <803557cc672ef0bcd9565c7d5d78e7053388f5d7.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: efremov@linux.com, Julia Lawall <Julia.Lawall@lip6.fr>,
        Dan Carpenter
 <dan.carpenter@oracle.com>
Date: Sun, 14 Jun 2020 13:01:51 -0700
In-Reply-To: <345c783b-a8cf-9dd1-29c6-d32b9b29053f@linux.com>
References: <20200604140805.111613-1-efremov@linux.com>
 <e4981fd76a88e18376c4e634c235501b57d321e7.camel@perches.com>
 <345c783b-a8cf-9dd1-29c6-d32b9b29053f@linux.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sun, 14 Jun 2020 23:17:56 +0200 (CEST)
X-Greylist: Delayed for 01:09:59 by milter-greylist-4.4.3 (osiris.lip6.fr
 [132.227.60.30]); Sun, 14 Jun 2020 23:17:50 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.30
Cc: cocci@systeme.lip6.fr, linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [PATCH] coccinelle: api: add kzfree script
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

On Sun, 2020-06-14 at 22:42 +0300, Denis Efremov wrote:
> On 6/4/20 7:27 PM, Joe Perches wrote:
> > On Thu, 2020-06-04 at 17:08 +0300, Denis Efremov wrote:
> > > Check for memset() with 0 followed by kfree().
> > 
> > Perhaps those uses should be memzero_explicit or kvfree_sensitive.
> > 
> Is it safe to suggest to use kzfree instead of memzero_explicit && kfree?
> Or it would be better to use kvfree_sensitive in this case.
> kzfree uses memset(0) with no barrier_data.
> 
> For example:
> diff -u -p a/drivers/crypto/inside-secure/safexcel_hash.c b/drivers/crypto/inside-secure/safexcel_hash.c
[]
> @@ -1081,8 +1081,7 @@ static int safexcel_hmac_init_pad(struct
>                 }
>  
>                 /* Avoid leaking */
> -               memzero_explicit(keydup, keylen);
> -               kfree(keydup);
> +               kzfree(keydup);

It would be better to use kvfree_sensitive()


_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
