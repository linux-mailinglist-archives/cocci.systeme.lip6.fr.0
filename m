Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0AB36719
	for <lists+cocci@lfdr.de>; Wed,  5 Jun 2019 23:55:34 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x55LsuqK024566;
	Wed, 5 Jun 2019 23:54:56 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 373B6776C;
	Wed,  5 Jun 2019 23:54:56 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 2AE587767
 for <cocci@systeme.lip6.fr>; Wed,  5 Jun 2019 23:54:54 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x55Lsrtu002839;
 Wed, 5 Jun 2019 23:54:53 +0200 (CEST)
Received: from [192.168.1.110] ([77.2.1.21]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N8XLj-1gV4Xr1RR3-014Sgt; Wed, 05 Jun 2019 23:42:18 +0200
To: Julia Lawall <julia.lawall@lip6.fr>
References: <5c138195-ac1a-4ad6-c6e6-720acd4ea34f@metux.net>
 <alpine.DEB.2.21.1906052251550.2622@hadrien>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <69c34970-8b6d-a2a3-2e8b-0b6560f78505@metux.net>
Date: Wed, 5 Jun 2019 21:42:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906052251550.2622@hadrien>
Content-Language: en-US
X-Provags-ID: V03:K1:QrngAlNs1USkdNS+pNKig2HUpcITuUuL7+ov594FJfokrRvwO3F
 vc9GJ3Lv1phwrLPYxMWeTrc6QDs/wQJXSBWqkyoPAdlj4+hKmhkyRcfMV8NF9qtLnsoN/zt
 cSmOXYQx0j4Jq9YeI804ujnzO+dfjBCt+60QilCEK5Q5WKJyRdM0n26dgvYaIWwaHTQQRxq
 QZg+1D4xpv6AYxQuODNZg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ltpkfLjOCNA=:2ccP8cCkSbNlnDWwgg0/LL
 zBDeIyjeUzTcskEEB50s/oM/ct5sscbcB33RxBqLtRBBhEFzpQoKFmI7Ijn+gzcjoJD9wK3Pi
 PV8VM2tMwajMjpKAsl6qyvr1G8U54NZVBTMXnjqdqWd1U1KpTe1OzIyd46U2rsWeep6N0KfV0
 H9c4FZqnlGBTUf3YwDlCfD3F9ynJ/6GKCKYArbXaWCAnzhg9Rza5utGJYf96TBrl12Qf86laj
 lRseLZyc0ZzCvZLk49o965+beg4KimbJRXAqqfg1mRTFuAbc1wV2wLAPELsWYhFfVfPh8Tphi
 lli4faqzhJYoIseXW7A3I4vJRv0s+jDGNsCa67myqfgH5CyQNXX7VOimDMCyN88aqllX1bL91
 qa4FC/3reNzlB0fuArRAnTiI55fLCCl+JkbuJiGJqYXbFOio3u10cOBcqf/0GelcWvxwz4lwY
 inv2Vp6aWwIXf8v7yYDn0WuBcVP0/P0+Z3IjC2gnTsIVLIrAmxyjVOrOf4x5T6WlcHgxvChgo
 ROlp9MWE7YVMQrm43bUP1Q4On10Xx5MF7Cq+wY+zNDVHIZAqxZ9xXENcOI5IhxRcWofy50dcG
 o4aecgHuq2eEUtr8Cb0jVhAyv/ihV4AQwQSVMn66vuMJvJG+NhVp/Egb5ihhMhqwz6KvJ7TF1
 /FpN0Wl7Z+AzG+7cONh13/x/W80r2+FwBjn0OWqayDojPqWcWQL/m1IpTxZh5bVDgKn+xg1ly
 mNASPF18py8cmhU4qYZkqn8epVYBfrLT68QOXWE2p2v6HWDzdGMcb+v9zb9TyVJuEB+gOrago
 3K5e9pv
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 05 Jun 2019 23:54:58 +0200 (CEST)
X-Greylist: Delayed for 00:12:35 by milter-greylist-4.4.3 (isis.lip6.fr
 [132.227.60.2]); Wed, 05 Jun 2019 23:54:53 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] how to replace obsolete #ifdef's
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

On 05.06.19 20:52, Julia Lawall wrote:

Hi,

> In principle you can remove some initializations and add them back.  

How can I match/remote on that "#ifdef ..." ?

Tried that, but got similar errors like Markus got (see his recent
mail).

It seems that spatch currently just doesn't understand preprocessor
directives at all, just treats them as literal strings. Maybe that
even would be fine in my case, if I only could match on that.

Any way for matching just a raw text pattern (w/o being parsed),
which includes special chars (eg. #) ?

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
